require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  def json(body)
    JSON.pars(body, symbolize_names: true)
  end
  
  # Helper method returns encoded credentials
  def encode(username, password)
    ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
  

  # Add more helper methods to be used by all tests here...
end
