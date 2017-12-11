class ListingEpisodesTest < ActionDispatch::Integration
  setup { @user = User.create!(username: 'foo', password: 'secret') }
  
  test 'valid username and password' do
    get '/episodes', {}, { 'Authorization' => encode(@user.username, @user.password)}
    assert_equal 200, response.status
  end
end