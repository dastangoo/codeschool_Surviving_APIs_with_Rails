class ChangingApiVersionsTest < ActionDispatch::IntegrationTest
  setup { @ip = '123.12.12.12'}
  
  test '/v1 returns version 1' do
    get '/v1/zombies', {}, { 'REMOTE_ADDR' => @ip}
    assert_equal 200, response.status
    assert_equal "#{@ip} Version One!", response.body
  end
  
  test '/v2 returns version 2' do
    get '/v2/zombies', {}, { 'REMOTE_ADDR' => @ip}
    assert_equal 200, response.status
    assert_equal "#{@ip} Version One!", response.body
  end
  
  test 'returns version one via Accept header' do
    get '/zombies', {},
      { 'REMOTE_ADDR' => @ip, 'Accept' => 'application/vnd.apocalypse.v1+json' }
      
    assert_equal 200, response.status
    assert_equal "#{@ip} Version One!", response.body
    assert_equal Mime::JSON, response.content_type
  end
end