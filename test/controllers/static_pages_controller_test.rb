require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get groups' do
    get static_pages_groups_url
    assert_response :success
  end
end
