require "base64"

def String_Encode(filename_location)

  begin
    file = File.open(filename_location)
    file_data = file.read
  rescue
    return "Could not open filename_location for encoding"
  end

  begin
    File.zero?(file_data)
    file_data["the string that will be base encoded"] = Base64.encode64("the string that will be base encoded")
  rescue
    return "Falied to find the string that will be base encoded"
  end

  File.write('Workspace\\Ruby\\Anis.txt', file_data)

  file.close

  return true

end

filename_location = "C:\\Users\\AS\\Desktop\\Infuse\\Workspace\\Ruby\\test2.txt"

puts String_Encode(filename_location)
