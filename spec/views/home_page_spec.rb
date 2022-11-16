require_relative '../rails_helper'

RSpec.describe 'home page', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user = User.create(
      name: 'Alzubair'
    )
    visit root_path
  end

  it 'should show the user name' do
    click_link('Zee App')
    expect(page.current_path).to eql(root_path)
  end

  it 'shows the Logo in the navbar' do
    expect(page).to have_content('Zee App')
  end

  it 'shows the Foods in the navbar' do
    expect(page).to have_content('Catagoies')
  end

  it 'shows the Sign up button in the navbar' do
    expect(page).to have_content('Sign up!')
  end

  it 'shows the Sign in button in the navbar' do
    expect(page).to have_content('Sign in')
  end

  it 'should navigate to Sign in page' do
    click_link('Sign in')
    expect(page.current_path).to eql(user_session_path)
  end

  it 'should navigate to Sign up page' do
    click_link('Sign up!')
    expect(page.current_path).to eql(new_user_registration_path)
  end
end
