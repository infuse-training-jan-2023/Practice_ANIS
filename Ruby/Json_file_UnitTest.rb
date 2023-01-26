require 'test/unit'
require_relative 'Json_file'

class Test_JsonFile < Test::Unit::TestCase
  def test_process_json_file
    filename_location = "C:\\Users\\AS\\Desktop\\Infuse\\Workspace\\Ruby\\Read_file.json"
    assert_equal({"name"=>"Nicole Smith", "age"=>25, "salary"=>25552.67, "firstname"=>"Nicole", "lastname"=>"Smith"}, process_json_file(filename_location))
  end

  def test_process_json_file_with_invalid_location
    filename_location = "C:\\Users\\AS\\Desktop\\Infuse\\Workspace\\Read_file.json"
    assert_equal("Invalid File Path or No such File or Directory", process_json_file(filename_location))
  end

  def test_process_json_file_with_invalid_file
    filename_location = "C:\\Users\\AS\\Desktop\\Infuse\\Workspace\\Content_file.txt"
    assert_equal("Invalid File Path or No such File or Directory", process_json_file(filename_location))
  end
end
