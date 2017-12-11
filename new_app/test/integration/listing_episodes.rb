class ListingEpisodesTest < ActionDispatch::IntegrationTest
  setup { @user = User.create!(username: 'foo', password: 'secret') }
  
  test 'valid username and password' do
    get '/episodes', {}, { 'Authorization' => 'Basic Zm9v0nNlY3JldA=' }
    assert_equal 200, response.status
  end
  
  test 'missing credentials' do
    get '/episodes', {}, {}
    assert_equal 401, response.status
  end
end
