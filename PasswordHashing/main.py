import dotenv
import os
import hashlib
import utils.helper
import hmac
import base64
import scrypt
from binascii import hexlify


def make_sha256(passwd):
    # string must be encoded before hashing
    hashed_passwd = hashlib.sha256(passwd.encode('utf-8')).hexdigest()
    return hashed_passwd


def make_hmac(salt, passwd):
    hashed_passwd = hmac.new(salt, passwd.encode('utf-8'), hashlib.sha256).hexdigest()
    return hashed_passwd


def make_pbkdf2(pbkdf_obj, passwd, salt):
    return hexlify(hashlib.pbkdf2_hmac(pbkdf_obj['hash'], passwd.encode('utf-8'), salt, pbkdf_obj['rounds'])).decode(
        'utf-8')


'''
(password: Any,
         salt: Any,
         N: int = 1 << 14,
         r: int = 8,
         p: int = 1,
         buflen: int = 64)
'''


def make_scrypt(scrypt_obj, passwd, salt):
    return hexlify(
        scrypt.hash(passwd, salt, scrypt_obj['N'], scrypt_obj['r'], scrypt_obj['p'], scrypt_obj['buflen'])).decode(
        'utf-8')


if __name__ == "__main__":
    dotenv.load_dotenv()
    ACCESS_TOKEN = os.getenv("ACCESS_TOKEN")
    LOOK_FOR = "password_hashing"
    response = utils.helper.get_the_problem(access_token=ACCESS_TOKEN, look_for=LOOK_FOR)

    passwd = response['password']
    salt = response['salt']
    decode_salt = base64.b64decode(salt)
    pbkdf_obj = response['pbkdf2']
    scrypt_obj = response['scrypt']

    # print("decoded salt ", decode_salt)
    # print(make_sha256(passwd))
    # print(make_hmac(decode_salt, passwd))
    # print(make_pbkdf2(pbkdf_obj,passwd,decode_salt))
    # print(make_scrypt(scrypt_obj, passwd, salt))
    payload ={
        "sha256":make_sha256(passwd),
        "hmac":make_hmac(decode_salt,passwd),
        "pbkdf2":make_pbkdf2(pbkdf_obj,passwd,decode_salt),
        "scrypt":make_scrypt(scrypt_obj,passwd,salt)
    }

    print(utils.helper.submit(access_token=ACCESS_TOKEN,look_for=LOOK_FOR,payload=payload))
