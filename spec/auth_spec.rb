require 'spec_helper'

describe "Authenticate methods" do
  it "should set the login information" do
    ello = Ello.new('email@domain.com', 'password')
    expect(ello.email).to eql('email@domain.com')
    expect(ello.password).to eql('password')
  end
end