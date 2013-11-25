#!/usr/bin/env ruby

require 'optparse'
require 'pry'
  options = {}
  option_parser = OptionParser.new do |opts| 
  opts.on("-p", "--prefixes PREFIXES" , "Requires a file for prefixes") do |x|
      options[:prefixes] = x
  end
  opts.on("-i", "--input INPUT" , "requires an input file") do |y|
      options[:input] = y
  end 
  opts.on("-o", "--output OUTPUT" , "requires a destination file") do |z|
      options[:output] = z
  end
  opts.on("-h", "--help", 'help') do 
    puts option_parser
  end
end

option_parser.parse!