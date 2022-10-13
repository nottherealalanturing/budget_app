require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test 'should get splashscreen' do
    get static_page_splashscreen_url
    assert_response :success
  end
end
