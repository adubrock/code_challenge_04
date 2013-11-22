require 'pry'
require 'optparse'

histohash = Hash.new(0)
File.open('raw_customers.txt', 'r').each_line do |customer|
  first = customer.match /^\S{1,}/
  first = first.to_s.strip

  histohash.include?("#{first}") ? histohash["#{first}"] += 1 :
                                   histohash["#{first}"] = 1
end
frequencies = histohash.sort_by { |a, b| b }
frequencies.reverse!
frequencies.each { |name, frequency| puts name + ' ' + frequency.to_s }
