require 'test/unit'

require_relative 'String_Encode'

class Test_StringEncode < Test::Unit::TestCase
  def test_String_Encode
    filename_location = "C:\\Users\\AS\\Desktop\\Infuse\\Workspace\\Ruby\\content_file.txt"
    assert_equal(true, String_Encode(filename_location))
  end

  def test_String_Encode_empty_file
    filename_location = "C:\\Users\\AS\\Desktop\\Infuse\\Workspace\\Ruby\\test.txt"
    assert_equal("Falied to find the string that will be base encoded", String_Encode(filename_location))
  end

  def test_String_Encode_invalid_file
    filename_location = "C:\\Users\\AS\\Desktop\\Infuse\\Workspace\\Ruby\\test2.txt"
    assert_equal("Falied to find the string that will be base encoded", String_Encode(filename_location))
  end
end

