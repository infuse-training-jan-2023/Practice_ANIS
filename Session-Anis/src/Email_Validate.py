import re

class Emailvalidate:
    def validate_email(self, email):
        validate = re.search('^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$', email)
        if(validate):
            return {"msg": "Email Valid"}
        else:
            return {"msg": "Email Invalid"}
