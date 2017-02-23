require 'rubygems'
require 'bundler/setup'
ENV['RACK_ENV'] = 'test'

require_relative 'first_app'
require 'test/unit'
require 'rack/test'
require 'faker'

class FirstAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_the_index
    get '/'
    assert last_response.ok?
    assert_equal 'Welcome to Earth, third rock from the sun!', last_response.body
  end

  def test_names_page
    name = Faker::Name.first_name
    get "/#{name}"
    assert last_response.ok?
    assert_equal "Hi, #{name}!", last_response.body
  end

  def test_bob_ross_lipsums_page
    lipsum = "I'm sort of a softy, I couldn't shoot Bambi except with a camera. And just raise cain. We don't have to be committed. We are just playing here."
    get "/lorem/bobross"
    assert last_response.ok?
    assert_equal lipsum, last_response.body
  end


end
