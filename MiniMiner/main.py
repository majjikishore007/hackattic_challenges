## problem statement
'''
noce =""
bits == cal_hash(block,nonce)

while  initial bits !=  difficulty
    cal_hash(block,noce++)

return nonce
'''
import json
import math
import os
import dotenv
import utils.helper
import hashlib


def get_nonce(block, difficulty, nonce):
    while True:
        nonce += 1
        block['nonce'] = nonce
        dig = make_hash(block)
        if check_leading_bits(difficulty, dig):
            return nonce


def make_hash(block):

    s_block = json.dumps(block, sort_keys=True, separators=(',', ':'))
    print("ser block ", s_block)
    return hashlib.sha256(s_block.encode()).digest()


def check_leading_bits(difficulty, hash):
    print("digest value -------------------------",hash)
    leading_zeros = '0' * math.ceil(difficulty/4)
    return hash.startswith(leading_zeros)


def sort_and_strip(block):
    return {key.strip(): value for key, value in sorted(block.items())}


if __name__ == "__main__":
    dotenv.load_dotenv()
    ACCESS_TOKEN = os.getenv("ACCESS_TOKEN")
    LOOK_FOR = "mini_miner"
    response = utils.helper.get_the_problem(look_for=LOOK_FOR, access_token=ACCESS_TOKEN)
    print(response)
    block = response['block']
    difficulty = response['difficulty']
    r = get_nonce(block, difficulty, nonce=-1)
    print("noce ", r)

    print(utils.helper.submit(LOOK_FOR,ACCESS_TOKEN,payload={"nonce":r}))
