require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/contacts" do
  before(:each) do
    @response = request("/contacts")
  end
end