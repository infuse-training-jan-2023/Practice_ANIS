import re


def validate_email(email):
    is_email_valid = re.search('^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$', email)
    if(is_email_valid):
        return {"msg": "Email Valid"}
    else:
        return {"msg": "Email Invalid"}
