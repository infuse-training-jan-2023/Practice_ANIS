import requests

def fetch_todo(num):
    if num >= 1 and num < 200:
        url = 'https://jsonplaceholder.typicode.com/todos/'+str(num)
        print(url)
        response = requests.get(url)
        return response.json()
    else:
        return "Number should be between 1 to 200"

