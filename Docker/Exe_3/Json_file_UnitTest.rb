require 'test/unit'
require_relative 'Json_file'

puts ARGV[0]

class Test_JsonFile < Test::Unit::TestCase

  def test_make_object
    obj = ProcessJsonData.new()
    assert obj.instance_of? ProcessJsonData
  end

  def test_process_json_file
    obj = ProcessJsonData.new()
    filename_location = "Read_file.json"
    assert_equal({"name"=>"Nicole Smith", "age"=>25, "salary"=>25552.67, "firstname"=>"Nicole", "lastname"=>"Smith"}, obj.process_json_file(filename_location))
  end

  def test_process_json_file_with_invalid_location
    obj = ProcessJsonData.new()
    filename_location = "Read_ile.json"
    assert_equal("Invalid File Path or No such File or Directory", obj.process_json_file(filename_location))
  end

  def test_process_json_file_with_invalid_file
    obj = ProcessJsonData.new()
    filename_location = "Content_file.txt"
    assert_equal("Invalid JSON File", obj.process_json_file(filename_location))
  end
end
