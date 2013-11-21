require 'pry'

histohash = {"Mr." => 1}
File.open('raw_customers.txt', 'r').each_line do |customer|
  $first = customer.match /^\S{1,}/
  $first = $first.to_s.split(" ")
   
   if histohash.include?($first) == false
      File.open('histogram.txt', 'r+').each_line do |prefixes|
      names = prefixes.split(" ")
      names.each {|name| frequencies[name] +=1}
      frequencies = frequencies.sort { |a, b| b }
      frequencies.reverse!
      frequencies.each { |name, frequency| puts name + " " + frequency.to_s}
    end
      else histohash["#{$first}"] +=1
        puts histohash
    end
 end

  #   prefix.puts line
  # end


# end

  # File.open('customers.csv', 'w+') do |csv|
  #   line = infile.gets
  #   csv.puts line
  # end