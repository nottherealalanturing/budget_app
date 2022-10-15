require 'rails_helper'

RSpec.describe 'Testing categories views', type: :feature do
  describe 'categories#index' do
    before(:each) do
      current_user = User.create! name: 'Tom', email: 'tom@example.com', password: 'password'
      (1..5).each do |i|
        current_user.groups.create(name: "Test category #{i}", icon: fixture_file_upload('budget.png'))
      end

      visit new_user_session_path
      fill_in 'Email', with: 'tom@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit user_groups_path(current_user)
    end

    it 'can see all the categories' do
      expect(page).to have_content 'Test category 1'
      expect(page).to have_content 'Test category 2'
      expect(page).to have_content 'Test category 3'
      expect(page).to have_content 'Test category 4'
      expect(page).to have_content 'Test category 5'
    end
  end
end
