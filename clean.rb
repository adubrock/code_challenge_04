# Clean.rb file
'customers.csv' = File.new('', 'w')
File.read('raw_customers.txt') do |text|
  File.open('customers.csv', 'w') do |customers|
    customers.puts text
  end
end
