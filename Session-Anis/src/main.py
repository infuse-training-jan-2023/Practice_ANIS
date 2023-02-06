from flask import Flask, Response, request
import json
from item_action import ItemActions
from user_repository import UserRepository
from Email_Validate import validate_email
from Password_Validate import validate_password
from api_request import fetch_todo


app = Flask(__name__)
item_actions = ItemActions()
user_repository = UserRepository()

@app.route('/', methods = ['GET'])
def welcome():
    return "Hello world"

@app.route('/items', methods = ['GET'])
def get_all_items():
    items = item_actions.get_all_items()
    return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/items/<int:id>', methods = ['GET'])
def get_item(id):
    items = item_actions.get_item(id)
    return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/items', methods = ['POST'])
def add_item():
    request_data = request.get_json()
    items = request_data["item"]
    reminder = request_data["reminder"]
    add_items = item_actions.add_item(items, reminder)
    if add_items == {}:
        return Response("{'error': 'Error adding the item'}", mimetype='application/json', status=500)
    return Response(json.dumps(add_items), mimetype='application/json', status = 201)

@app.route('/items/<int:id>', methods = ['DELETE'])
def delete_item(id):
    delete_item = item_actions.delete_item(id)
    if delete_item == {}:
        return Response("{'error': 'Error deleting the item'}", mimetype='application/json', status=500)
    return Response(json.dumps(delete_item), mimetype='application/json', status = 201)

@app.route('/items/<int:id>', methods = ['PUT'])
def update_item(id):
    request_data = request.get_json()
    update_item = item_actions.update_item(request_data, id)
    if update_item == {}:
        return Response("{'error': 'Error updating the item'}", mimetype='application/json', status=500)
    return Response(json.dumps(update_item), mimetype='application/json', status = 201)

@app.route('/user', methods = ['POST'])
def add_user():
    request_data = request.get_json()
    name = request_data["name"]
    address = request_data["address"]
    mobile = request_data["mobile"]
    add_user = user_repository.add_user(name, address, mobile)
    if add_user == {}:
        return Response("{'error': 'Error adding user'}", mimetype='application/json', status=500)
    return Response(json.dumps(add_user), mimetype='application/json', status = 201)

@app.route('/validate_email', methods = ['POST'])
def check_email():
    request_data = request.get_json()
    email = request_data["email"]
    is_valid = validate_email(email)
    return Response(json.dumps(is_valid), mimetype='application/json', status=200)

@app.route('/validate_pass', methods = ['POST'])
def check_pass():
    request_data = request.get_json()
    passwd = request_data["pass"]
    is_valid = validate_password(passwd)
    return Response(json.dumps(is_valid), mimetype='application/json', status=200)

@app.route('/api/<int:num>', methods=(['GET']))
def fetch_api(num):
    items = fetch_todo(num)
    return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/savefile', methods = ['GET'])
def save_items():
    items = item_actions.save_data_to_file()
    return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/square_of_num/<int:num>', methods = ['GET'])
def square_of_num(num):
    return str(num * num)


if __name__ == '__main__':
    app.run(debug = "True", port = 5000, host = '0.0.0.0')




