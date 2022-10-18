require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create name: 'Tom', email: 'tom@example.com', password: '123456'
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get user_groups_path(@user)
      expect(response).to have_http_status(:found)
    end
  end
end
