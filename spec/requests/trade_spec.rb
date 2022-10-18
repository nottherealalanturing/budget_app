require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'Kelvin', password: 'password', email: 'kelybush@gmail.com')
    @group = @user.groups.create(name: 'Shopping', icon: fixture_file_upload('budget.png'))
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get user_groups_path(@user)
      expect(response).to have_http_status(:found)
    end
  end
end
