# Encoding:utf-8

require 'rspec'
require './analyze.rb'

describe 'analyze.rb' do

  it "should create the file ('histogram.txt')" do
    File.exists?('histogram.txt').should == true
  end

  it "should gather the first word from each line of ('raw_customers.txt')" do
    histogram.should be_and_instance_of(Array) == true
  end
end
