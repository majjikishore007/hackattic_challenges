import os
import cv2
import dotenv
import numpy as np
import requests
from PIL import Image
from io import BytesIO
import utils.helper


def get_image(img_url):
    res = requests.get(img_url)
    image = np.array(Image.open(BytesIO(res.content)))
    return image


def get_faces_detected(img_url):
    image = get_image(img_url)
    # converting the image to gray
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # each tile size from the total 8*8 grid
    # total grid 800 *800
    # size of each tile 100 * 100
    tile_size = (image.shape[1] // 8, image.shape[0] // 8)

    # face detection model
    face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
    faces_in_tiles = []

    for row in range(8):
        for col in range(8):
            # Extract the tile
            tile = gray[row * tile_size[1]:(row + 1) * tile_size[1], col * tile_size[0]:(col + 1) * tile_size[0]]
            # Detect faces
            faces = face_cascade.detectMultiScale(tile, 1.1, 4)

            # If any faces are found, add the row and column as a pair to the list
            if len(faces) > 0:
                faces_in_tiles.append([row, col])

    return faces_in_tiles


if __name__ == "__main__":
    print("hello world")
    dotenv.load_dotenv()

    ACCESS_TOKEN = os.getenv("ACCESS_TOKEN")
    LOOK_FOR = "basic_face_detection"

    response = utils.helper.get_the_problem(look_for=LOOK_FOR, access_token=ACCESS_TOKEN)

    payload = {
        "face_tiles": get_faces_detected(response['image_url'])
    }

    print(utils.helper.submit(look_for=LOOK_FOR, access_token=ACCESS_TOKEN, payload=payload))
