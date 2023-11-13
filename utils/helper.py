import requests


def get_the_problem(look_for, access_token):
    URL = f"https://hackattic.com/challenges/{look_for}/problem?access_token={access_token}"
    data = requests.get(URL)
    return data.json()


def submit(look_for, access_token, payload):
    URL = f"https://hackattic.com/challenges/{look_for}/solve?access_token={access_token}"
    data = requests.post(URL, json=payload)
    return data.json()
