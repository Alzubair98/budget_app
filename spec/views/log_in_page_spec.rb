
require_relative '../rails_helper'

RSpec.describe 'Log in page', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user = User.create(
      name: 'Alzubair',
      email: 'alzubair@gmail.com',
      password: '123456'
    )
    visit user_session_path
  end

  it 'shows the Login button' do
    expect(page).to have_content('Login')
  end

  it 'are redirected to root page when login is sucessfull' do
    fill_in 'Email', with: @user.email.to_s
    fill_in 'Password', with: @user.password.to_s
    find("input[type='submit']").click
    expect(page).to have_current_path(root_path)
  end
end
