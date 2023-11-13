import base64
import os
import struct

from dotenv import load_dotenv

from utils import helper


def un_pack(data):
    format_string = "iIhfd"
    var = struct.unpack(format_string, data[:24])
    solution_json = {
        "int": var[0],
        "uint": var[1],
        "short": var[2],
        "float": var[3],
        "double": var[4],
        "big_endian_double": struct.unpack('!d', data[24:])[0]
    }

    return solution_json


if __name__ == '__main__':
    load_dotenv()
    ACCESS_TOKEN = os.getenv("ACCESS_TOKEN")

    data = helper.get_the_problem("help_me_unpack", ACCESS_TOKEN)
    byte_pack_base64 = data['bytes']
    decoded_data = base64.b64decode(byte_pack_base64)
    print("Decoded Data:", decoded_data)

    print("the values ::::::::::", un_pack(decoded_data))
    payload = un_pack(decoded_data)
    data = helper.submit("help_me_unpack", ACCESS_TOKEN, payload)
    print("data submit :::::::::::", data)
