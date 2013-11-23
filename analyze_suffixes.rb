require 'pry'
require 'optparse'

suffixes = Hash.new(0)
File.open('raw_customers.txt', 'r').each_line do |get_suff|
  suffix_unedited = get_suff.match /\S+ {1,2}\(?\d/
  suffix_ed = suffix_unedited.to_s.strip.split(' ')
  suffix = suffix_ed[0]
  suffixes.include?("#{suffix}") ? suffixes["#{suffix}"] += 1 :
                                   suffixes["#{suffix}"] = 1
end
frequencies = suffixes.sort_by { |a, b| b }
frequencies.reverse!
frequencies.each { |name, frequency| puts name + ' ' + frequency.to_s }
