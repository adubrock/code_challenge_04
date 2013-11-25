 # Encoding:utf-8
 # Clean.rb file
require 'csv'
require 'pry'
#   arr = IO.readlines('raw_customers.txt')
# File.open('customers.csv', 'w+') do |csv|
#   csv.puts arr
# end

# The following regex will pull the phone numbers and whitespace
# in front of the phone numbers:
# /\s*\d*\.*-*\(*\d*\)*\d*-*\(*\d*.{12}$/

prefixes = []
suffixes = []

File.open('prefix_words.txt').each_line do |prefix|
  prefixes << prefix.to_s.strip
end

File.open('suffix_words.txt').each_line do |suffix|
  suffixes << suffix.to_s.strip
end

puts "prefix, first_name, middle, last_name, suffix, phone_number, phone_extension"

File.open('raw_customers.txt', 'r').each_line do |customer|
  # phone = customer.match(/\s*\d*\.*-*\(*\d*\)*\d*-*\(*\d*.{12}$/)
  #         .to_s.strip
  name = customer.gsub(/\s*\d*\.*-*\(*\d*\)*\d*-*\(*\d*.{12}$/, '')
         .to_s.strip
  names = name.split(" ")
  if suffixes.include?(names.last)
    suffix = names.last
    names.pop
  else
    suffix = ''
  end
  if prefixes.include?(names.first)
    prefix = names.first
    names.delete_at(0)
  else
    prefix = ''
  end
  last = names.last
  names.pop
  first = names[0]
  names.length == 2 ? middle = names.last : middle = ''
  phone = customer.scan(/\d+/)
  if phone.length == 5
      phone_number = "1.#{phone[1]}.#{phone[2]}.#{phone[3]}"
      phone_extension = "#{phone[4]}"
  elsif phone.length == 4
    if phone[0] == 1
      phone_number = "1.#{phone[1]}.#{phone[2]}.#{phone[3]}"
      phone_extension = ''
    else
      phone_number = "1.#{phone[0]}.#{phone[1]}.#{phone[2]}"
      phone_extension = "#{phone[3]}"
    end
  elsif phone.length == 3
    phone_number = "1.#{phone[0]}.#{phone[1]}.#{phone[2]}"
    phone_extension = ''
  else
    puts 'Invalid phone number!'
  end
puts "#{prefix},#{first},#{middle},#{last},#{suffix},#{phone_number},#{phone_extension}"
end


