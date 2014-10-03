require 'spec_helper'

describe "Authenticate methods" do
  it "should set the login information" do
    ello = Ello.new('email@domain.com', 'password')
    expect(ello.email).to eql('email@domain.com')
    expect(ello.password).to eql('password')
  end
  
  it "should redirect after login" do
    ello = Ello.new(ENV['ELLO_USER'], ENV['ELLO_PASSWORD'])
    ello.authenticate!
    expect(ello.authenticate!.to_s).to include('<html><body>You are being')
  end
end