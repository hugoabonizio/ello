require 'http'
require 'nokogiri'
require 'logger'

class Ello
  attr_accessor :email, :password, :friends_page
  
  LOGIN_URL = 'https://ello.co/enter'
  
  def initialize(email, password)
    @email = email
    @password = password
  end
  
  def authenticate!
    login_page = HTTP.get(LOGIN_URL)
    html = Nokogiri::HTML(login_page.to_s)
    @csrf_token = html.xpath("//meta[@name='csrf-token']/@content").first
    
    form = {
      'utf8' => '✓',
      'authenticity_token' => @csrf_token.to_s,
      'user[email]' => @email,
      'user[password]' => @password,
      'user[remember_me]' => 0,
      'user[remember_me]' => 1,
      'commit' => 'Enter Ello' 
    }
    @friends_page = HTTP.with_headers('Cookie' => login_page.headers['Set-Cookie']).post(LOGIN_URL, form: form)
  end
  
  def publications
    
  end
end