require 'rails_helper'

RSpec.feature "adding users" do
  describe "pages Spec" do
   def log_in_as(the_user)
    visit sign_up_path
    fill_in :user_email, with: the_user.email
    fill_in :user_first_name, with: the_user.first_name
    fill_in :user_last_name, with: the_user.last_name
    fill_in :user_password, with: the_user.password
    fill_in :user_password_confirmation, with: the_user.password_confirmation
    click_on("Create User")
    expect(page).to have_content(the_user.first_name)
    expect(page).to have_content(the_user.last_name)
    click_on("Logout")
    expect(page).to have_content("Sign in first!")
    # scenario "allow user to sign in and add a post" do
    visit sign_in_path
    fill_in :user_session_email, with: the_user.email
    fill_in :user_session_password, with: the_user.password
    click_on("Sign in")
    expect(page).to have_content("Welcome to Twitter!")
    click_on("Start Twitter!")
    visit posts_path
    fill_in :post_message, with: "this is a test message!"
    click_on("Create twitter")
    expect(page).to have_content("this is a test message!")
   end



    it  "should test log_in_as method here" do
      build(:user) do |user|
      log_in_as(user)
      end
    end
   # end
    end

end

# reference
# http://testdrivenwebsites.com/2011/08/17/different-ways-of-code-reuse-in-rspec/