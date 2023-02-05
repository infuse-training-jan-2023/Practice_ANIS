import re

class Passwordvalidate:
    def validate_password(self, passwd):
        validate = re.fullmatch(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$', passwd)
        if(validate):
            return {"msg": "Password is strong"}
        else:
            return {"msg": "Password should be geater then 8 characters and should include Uppercase, Lowercase and Special character"}

