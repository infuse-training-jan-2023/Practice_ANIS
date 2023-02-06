import re


def validate_password(passwd):
    is_password_valid = re.fullmatch(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$', passwd)
    if(is_password_valid):
        return {"msg": "Password is strong"}
    else:
        return {"msg": "Password should be geater then 8 characters and should include Uppercase, Lowercase and Special character"}

