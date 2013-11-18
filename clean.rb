# Clean.rb file
# File.read('raw_customers.txt') do |text|
#   #File.open('customers.csv' 'w') do |customers|
#     puts text
#   end
# #end
require 'csv'

arr = IO.readlines('raw_customers.txt')
File.open("customers.csv","w+") do |csv|
csv.puts arr
end