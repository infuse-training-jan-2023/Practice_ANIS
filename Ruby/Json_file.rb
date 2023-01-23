require 'json'

def process_json_file(filename_location)

  begin

    file = File.open(filename_location)
    file_data = file.read
  rescue
    return "Invalid File Path or No such File or Directory"
  end

  begin
    file_data = JSON.parse(file_data)
  rescue
    return "Invalid JSON File"
  end

  name = file_data['name']

  time = Time.now.utc

  puts time.strftime("%d/%m/%Y")
  # puts time.strftime("%Y-%m-%d %H:%M:%S")

  stime = time.to_s

  newfile = 'Workspace\\Ruby\\Anis_' + time.strftime("%Y-%m-%d %H-%M-%S") + '.json'

  puts newfile

  file_write(newfile, file_data)

  file_data.store("firstname", name.split[0])
  file_write(newfile, file_data)

  file_data.store("lastname", name.split[1])
  file_write(newfile, file_data)

  return file_data

  file.close



end

def file_write(filename_location, file)

  File.write(filename_location, JSON.dump(file))

end

filename_location = "C:\\Users\\AS\\Desktop\\Infuse\\Workspace\\Ruby\\Read_file.json"

puts process_json_file(filename_location)


