# Encoding:utf-8

require 'rspec'
require './analyze_suffixes.rb'

describe 'analyze.rb' do

  it "should gather prefixes from each line of ('raw_customers.txt')" do
    File.read('./histogram.txt').should include 'Mr.'
  end

  it "output should match ('groovy_test_file.txt')" do
    File.read('./histogram.txt').should == File.read('./groovy_test_file.txt')
  end

  specify 'regex should match prefixes' do
    File.read('./histogram.txt').should match(/Mr./)
  end
end
