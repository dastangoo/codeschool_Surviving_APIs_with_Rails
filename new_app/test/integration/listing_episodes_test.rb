class ListingEpisodesTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!
  end
  
  test 'valid authentication with token' do
    # Includes user unique token
    get '/episodes', {}, { 'Authorization' => "Token token=#{@user.auth_token}" }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
  
  def token_header(token)
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end
  # Simulates invalid token
  test 'invalid authentication' do
    # get '/episodes', {}, { 'Authentication' => @user.auth_token + 'fake'}
    get '/episodes', {}, { 'Authentication' => token_header(@user.auth_token)}
    assert_equal 401, response.status
  end
end