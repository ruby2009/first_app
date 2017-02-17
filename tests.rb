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
    assert_equal 'Hello World', last_response.body
  end

  def test_names_page
    name = Faker::Name.first_name
    get "/#{name}"
    assert last_response.ok?
    assert_equal "Hi there, #{name}", last_response.body
  end

  def test_lipsums_page
    # TODO: Fill me in to check each lipsum you support.
  end


end
