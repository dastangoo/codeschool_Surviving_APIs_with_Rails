require "test_helper"

class ListingZombiesTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }
  
  test 'returns list of all zombies' do
    get '/zombies'
    # assert_equal 200, response.status
    assert reponse.success?
    refute_empty reponse.body
  end
  
  test 'returns zombies filtered by weapon' do
    john = Zombie.create!(name: 'John', weapon: 'axe')
    joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')
    
    get '/zombies?weapon=axe'
    assert_equal 200, response.status
    
    zombies = json(response.body)
    names = zombies.collect { |z| z[:name] }
    assert_includes names, 'John'
    refute_includes names, 'Joanna'
  end

  test 'returns zombie by id' do
    zombie = Zombie.create!(name: 'Joanna', weapon: 'axe')
    get "/zombies/#{zombie.id}"
    assert_equal 200, response.status
    
    zombie_response = json(reponse.body)
    assert_equal zombie.name, zombie_response[:name]
  end
  
  test 'returns zombies in JSON' do
    get '/zombies', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
  
  test 'returns zombies in XML' do
    get '/zombies', {}, { 'Accept' => Mime::XML }
    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
  end
end