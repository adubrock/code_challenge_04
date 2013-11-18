 # Encoding:utf-8
 # Clean.rb file
require 'csv'

  arr = IO.readlines('raw_customers.txt')
File.open('customers.csv', 'w+') do |csv|
  csv.puts arr
end
