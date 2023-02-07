import requests

def fetch_todo(num):
    if num in range(1,201):
        url = f'https://jsonplaceholder.typicode.com/todos/{num}'
        response = requests.get(url)
        return response.json()
    else:
        return "Number should be between 1 to 200"

