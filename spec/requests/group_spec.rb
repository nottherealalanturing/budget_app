require 'rails_helper'

RSpec.describe 'Group', type: :request do
  describe 'GET group#index' do
    before(:each) do
      user = User.create name: 'Tom', email: 'tom@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get user_groups_path(user)
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      expect(response).to render_template(:index)
    end

    it "should render page contenting 'Group'" do
      expect(response.body).to include('Group')
    end
  end
end
