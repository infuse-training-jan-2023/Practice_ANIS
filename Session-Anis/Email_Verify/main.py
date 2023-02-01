from flask import Flask, Response, request
from Email_Validate import Emailvalidate
import json

app = Flask(__name__)
validate = Emailvalidate()

@app.route('/validate_email', methods = ['POST'])
def validate_email():
    request_data = request.get_json()
    email = request_data["email"]
    items = validate.validate_email(email)
    print(items)
    return Response(json.dumps(items), mimetype='application/json', status=200)

if __name__ == '__main__':
    app.run(debug = "True", port = 5000, host = '0.0.0.0')
