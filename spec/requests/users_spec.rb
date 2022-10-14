require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "GET /users/sign_in" do
    before(:all) do 
      get user_session_path
    end 
    it "should have a sign in page" do
      expect(response).to have_http_status(:ok)
    end

    it "should include log in" do
      expect(response.body).to include("Log in")
    end
  end

  describe "GET /users/sign_up" do
    before(:all) do 
      get new_user_registration_path
    end 
    it "should have a sign in page" do
      expect(response).to have_http_status(:ok)
    end

    it "should include log in" do
      expect(response.body).to include("Sign up")
    end
  end
end
