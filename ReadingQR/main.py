import os
from io import BytesIO

import requests
from PIL import Image
from dotenv import load_dotenv
from pyzbar.pyzbar import decode

from utils import helper


def read_qr_code(url):
    # Fetch the image from the URL
    response = requests.get(url)
    image = Image.open(BytesIO(response.content))
    
    # Decode the QR code
    decoded_data = decode(image)
    if decoded_data:
        return decoded_data[0].data.decode()
    else:
        return "No QR code found"


if __name__ == "__main__":
    load_dotenv()
    ACCESS_TOKEN = os.getenv("ACCESS_TOKEN")
    look_for = "reading_qr"

    data = helper.get_the_problem(look_for, access_token=ACCESS_TOKEN)
    print("data", data)
    final_res ={
        "code":read_qr_code(data['image_url'])
    }

    print(helper.submit(look_for,ACCESS_TOKEN,final_res))