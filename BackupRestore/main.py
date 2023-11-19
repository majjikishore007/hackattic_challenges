import base64
import gzip
import os
import subprocess
import io
import dotenv
import utils.helper

def restore_pg_dump_in_docker(container_name, database_name, db_username, db_password, host_dump_file_path,
                              container_dump_file_path):
    try:
        copy_cmd = f"docker cp {host_dump_file_path} {container_name}:{container_dump_file_path}"
        subprocess.run(copy_cmd, shell=True, check=True)
        print(f"Dump file copied to container: {container_dump_file_path}")

        restore_cmd = psql_cmd = f"cat {container_dump_file_path} | PGPASSWORD={db_password} psql -h localhost -d {database_name} -U {db_username}"
        docker_cmd = f"docker exec -i {container_name} /bin/bash -c \"{restore_cmd}\""
        print(f"Executing command: {docker_cmd}")

        subprocess.run(docker_cmd, shell=True, check=True)
        print("Database restore completed successfully.")

    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e}")
    except Exception as e:
        print(f"Unexpected error: {e}")


def get_live_data(container_name, database_name, db_username, db_password):
    query = "SELECT ssn FROM criminal_records WHERE status='alive';"
    # Using single quotes for the SQL query
    psql_cmd = f"PGPASSWORD={db_password} psql -t -A -h localhost -d {database_name} -U {db_username} -c \\\"{query}\\\""

    # Constructing the full Docker exec command using bash -c
    docker_cmd = f'docker exec -i {container_name} /bin/bash -c "{psql_cmd}"'
    print(docker_cmd)

    # Running the command and capturing the output
    try:
        result = subprocess.run(docker_cmd, shell=True, check=True, stdout=subprocess.PIPE, text=True)
        ssns = result.stdout.strip().split('\n')
        return ssns
    except subprocess.CalledProcessError as e:
        print(f"An error occurred: {e}")
        return []


def decode_and_decompress_dump(encoded_dump, output_file_path):
    try:
        decoded_data = base64.b64decode(encoded_dump)

        with gzip.open(io.BytesIO(decoded_data), 'rb') as decompressed_file:
            decompressed_data = decompressed_file.read()

        with open(output_file_path, 'wb') as file:
            file.write(decompressed_data)

        print(f"Decompressed dump saved to {output_file_path}")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    print("hello world")
    dotenv.load_dotenv()
    ACCESS_TOKEN = os.getenv('ACCESS_TOKEN')
    LOOK_FOR = "backup_restore"

    response = utils.helper.get_the_problem(look_for=LOOK_FOR, access_token=ACCESS_TOKEN)

    print("response ", response)

    # decode_and_decompress_dump(response['dump'], "database_dump")

    container_name = 'postgres'
    database_name = 'recover'
    db_username = 'postgres'
    db_passwd = 'postgres'
    host_dump_file_path = 'database_dump'  # Path on the host machine
    container_dump_file_path = 'tmp/database_dump.sql'  # Path inside the container
    # print(restore_pg_dump_in_docker(container_name, database_name, db_username, db_passwd, host_dump_file_path,container_dump_file_path))
    print()
    payload ={
    "alive_ssns":get_live_data(container_name, database_name, db_username, db_passwd)
    }
    print(utils.helper.submit(look_for=LOOK_FOR,access_token=ACCESS_TOKEN,payload=payload))
