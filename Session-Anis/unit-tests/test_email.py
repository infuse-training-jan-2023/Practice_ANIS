from src.Email_Validate import validate_email


def test_validate_email(mocker):
    mock = mocker.patch('src.Email_Validate.validate_email', return_value={"msg": "Email Valid"})
    item_return = validate_email("anisahmed@gmail.com")
    assert item_return == {"msg": "Email Valid"}

def test_validate_invalid_email(mocker):
    mock = mocker.patch('src.Email_Validate.validate_email', return_value={"msg": "Email Valid"})
    item_return = validate_email("anisahmedgmail.com")
    assert item_return == {"msg": "Email Invalid"}
