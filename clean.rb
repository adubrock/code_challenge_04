 # Encoding:utf-8
 # Clean.rb file
require 'csv'
require 'optparse'
require 'pry'

options = {}
option_parser = OptionParser.new do |opts|
  opts.on('-p', '--prefixes PREFIXES' , 'Requires a file for prefixes') do |x|
    options[:prefixes] = x
  end
  opts.on('-i', '--input INPUT' , 'requires an input file') do |y|
    options[:input] = y
  end
  opts.on('-o', '--output OUTPUT' , 'requires a destination file') do |z|
    options[:output] = z
  end
  opts.on('-h', '--help', 'help') do
    puts option_parser
  end
end

option_parser.parse!

prefixes = []
suffixes = []

File.open(options[:prefixes]='prefix_words.txt').each_line do |prefix|
  prefixes << prefix.to_s.strip
end

File.open('suffix_words.txt').each_line do |suffix|
  suffixes << suffix.to_s.strip
end

File.open(options[:output]='customers.csv', 'w') do |file|
  file.print 'prefix, first_name, middle, last_name, suffix, '
  file.puts 'phone_number, phone_extension'
end

File.open(options[:input]='raw_customers.txt', 'r').each_line do |customer|
  name = customer.gsub(/\s*\d*\.*-*\(*\d*\)*\d*-*\(*\d*.{12}$/, '')
         .to_s.strip
  names = name.split(' ')
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
  File.open(options[:output]='customers.csv', 'a+') do |file|
    file.print "#{prefix},#{first},#{middle},"
    file.puts "#{last},#{suffix},#{phone_number},#{phone_extension}"
  end
end
