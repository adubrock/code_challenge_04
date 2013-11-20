# Encoding:utf-8

require 'rspec'
require './analyze.rb'

describe 'analyze.rb' do

  it "should gather prefixes from each line of ('raw_customers.txt')" do
    File.read('./histogram.txt').should include 'Mr.'
  end
end
