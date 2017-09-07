module Features
  # A macro that can be used in other feature rspec tests
  def sign_in(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"

  end
end
