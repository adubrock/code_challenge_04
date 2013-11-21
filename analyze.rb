require 'pry'

histohash = {}

File.open('raw_customers.txt', 'r') do |customers|
  customers.each do |customer|
  first = customer.gets.to_s.match /^\S{1,}/
  File.open('histogram.txt', 'r+') do |prefixes|
    prefixes.each do |line|
      line.to_s.split("")

      puts line

      "add to hash" unless "it's there already"
      # histohash[pre] = value
    end
  end
  #   prefix.puts line
  # end

end
# end

  # File.open('customers.csv', 'w+') do |csv|
  #   line = infile.gets
  #   csv.puts line
  # end
