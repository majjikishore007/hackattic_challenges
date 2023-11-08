import requests


def get_the_problem(look_for, access_token):
    URL = f"https://hackattic.com/challenges/{look_for}/problem?access_token={access_token}"
    data = requests.get(URL)
    return data.json()


def submit_the_solution(access_token):
    pass
