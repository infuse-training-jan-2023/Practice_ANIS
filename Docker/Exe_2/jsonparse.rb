require 'json'
require 'pp'
num1 = ENV["num1"]
num2 = ENV["num2"]
result = num1.to_i+num2.to_i
puts result
puts "Sum of two number is: "+ result.to_s
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
