require 'json'
require 'pp'
test = ENV["version"]
puts test
filepath = ARGV[0]
puts filepath
file = File.open(filepath)
file_data = file.read
data = JSON.parse(file_data)
pp data



# -------- For reference ----------
# File.open(ARGV[0]).each do |line|
#   puts line
# end

# data.each do |single|
#     puts single['name']
# end

# json.each do |single|
#   puts single
# end
