require 'rspec'

describe 'raw_customers.txt exists' do

  it "should exist ('../raw_customers.txt')" do
    File.exists?('../raw_customers.txt').should == true
  end
end
