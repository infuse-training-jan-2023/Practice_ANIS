from src.Password_Validate import validate_password

def test_validate_password(mocker):
    mock = mocker.patch('src.Password_Validate.validate_password', return_value={"msg": "Password is strong"})
    item_return = validate_password("Anis@shaikh1")
    assert item_return == {"msg": "Password is strong"}

def test_validate_invalid_password(mocker):
    mock = mocker.patch('src.Password_Validate.validate_password', return_value={"msg": "Password should be geater then 8 characters and should include Uppercase, Lowercase and Special character"})
    item_return = validate_password("Anis@shaikh")
    assert item_return == {"msg": "Password should be geater then 8 characters and should include Uppercase, Lowercase and Special character"}
