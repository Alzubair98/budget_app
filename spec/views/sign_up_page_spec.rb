require_relative '../rails_helper'

RSpec.describe 'Sign up page', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user = User.create(
      name: 'Alzubair'
    )
    visit new_user_registration_path
  end

  it 'shows the Sign up button' do
    expect(page).to have_content('Sign up')
  end
end
