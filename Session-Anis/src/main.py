from flask import Flask, Response, request
from item_action import ItemActions
from Email_Validate import Emailvalidate
import json

app = Flask(__name__)
item_actions = ItemActions()
validate = Emailvalidate()

@app.route('/items', methods = ['GET'])
def get_all_items():
    items = item_actions.get_all_items()
    print(items)
    return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/item', methods = ['POST'])
def add_items():
    request_data = request.get_json()
    items = request_data["item"]
    reminder = request_data["reminder"]

    add_items = item_actions.add_item(items, reminder)
    if add_items == {}:
        return Response("{'error': 'Error adding the item'}", mimetype='application/json', status=500)
    return Response(json.dumps(add_items), mimetype='application/json', status = 201)

@app.route('/validate_email', methods = ['POST'])
def validate_email():
    request_data = request.get_json()
    email = request_data["email"]
    items = validate.validate_email(email)
    print(items)
    return Response(json.dumps(items), mimetype='application/json', status=200)


if __name__ == '__main__':
    app.run(debug = "True", port = 5000, host = '0.0.0.0')

# @app.route('/', methods = ['GET'])
# def welcome():
#     return "Hello world"

# @app.route('/item/<int:num>', methods = ['GET'])
# def item(num):
#     return str(num)

# @app.route('/square_of_num/<int:num>', methods = ['GET'])
# def square_of_num(num):
#     return str(num * num)


