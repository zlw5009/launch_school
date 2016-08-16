
ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"

require_relative "../pairup"

class PairupTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end