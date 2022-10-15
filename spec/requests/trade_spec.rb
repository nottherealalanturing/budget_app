require 'rails_helper'

RSpec.describe 'Trade', type: :request do
  describe 'GET Trade#new' do
    before(:each) do
      current_user = User.create name: 'Tom', email: 'tom@example.com', password: 'password'
      post user_session_path, params: { current_user: { email: current_user.email, password: current_user.password } }
      group = current_user.groups.create(name: 'Shopping', icon: fixture_file_upload('budget.png'))
      get new_user_group_trade_path(current_user, group)
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:new)
    end
  end
end
