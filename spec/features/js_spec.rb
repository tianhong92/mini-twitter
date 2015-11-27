require 'rails_helper'

RSpec.feature "JS check" do
  feature 'Home' do
    #capybara-webkit run the test against a real HTTP version with js => true
    it 'should not have JavaScript errors', :js => true do
      visit root_path
      expect(page).not_to have_errors
      visit sign_in_path
      expect(page).not_to have_errors
      visit posts_path
      expect(page).not_to have_errors
      visit sign_up_path
      expect(page).not_to have_errors
    end
  end
end