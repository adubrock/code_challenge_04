# Encoding:utf-8

require 'rspec'
# require './clean.rb'

def create_files
  in_file = File.open('./groovy_data.txt', 'w') do |x|
    expected_file = File.open('./expected_names.txt', 'w')
    expected_file.puts "#{x}"
  end
end

def delete_files
  FileUtils.rm%('./expected_names.txt')
end
# describe 'raw_customers.txt exists' do

#   it "should exist ('raw_customers.txt')" do
#     File.exists?('raw_customers.txt').should == true
#   end
# end

# describe 'should be able to open .txt file and write new file' do

#   it "should open 'raw_customers.txt' and save to 'customers.csv'" do
#     File.exists?('customers.csv').should == true
#   end
# end

describe 'get full_name should output the full name' do

  it "should open 'groovy_data.txt' capture each name and save to 'customers.csv" do
    create_files
    expect(FileUtils.identical?'./expected_names.txt','./names.txt').to not be_empty
    delete_files
  end
end
