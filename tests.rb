# Encoding:utf-8

require 'rspec'
require './clean.rb'

describe 'raw_customers.txt exists' do

  it "should exist ('raw_customers.txt')" do
    File.exists?('raw_customers.txt').should == true
  end
end
describe 'should be able to open .txt file and write new file' do

  it "should open 'raw_customers.txt' and save to 'customers.csv'" do
    File.exists?('customers.csv').should == true
  end
end
