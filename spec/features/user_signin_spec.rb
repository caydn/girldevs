require "rails_helper"

RSpec.decribe "User signing in" do

  background do
    @user = User.create(email: "example@gmail.com", password: "password")
  end

  scenario "successfully" do
    sign_in @user

    expect(page).to have_content @user.email
  end

  scenario "unsuccessfully" do
    visit new_user_session_path
    fill_in "Email", with: "wrongemail"
    fill_in "Password", with: "wrongpassword"
    click_on "Sign in"

    expect(page).not_to have_content @user.email
  end

end
