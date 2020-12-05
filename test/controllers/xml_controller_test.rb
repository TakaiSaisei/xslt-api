require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  test 'check xml format' do
    get '/?limit=1&format=xml'
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xml'
  end

  test 'check rss format' do
    get '/?limit=1&format=rss'
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end
end
