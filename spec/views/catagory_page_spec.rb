require_relative '../rails_helper'

RSpec.describe 'catagory page', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user = User.create(
      name: 'Alzubair',
      email: 'alzubair@gmail.com',
      password: '123456'
    )
    visit user_session_path
    fill_in 'Email', with: @user.email.to_s
    fill_in 'Password', with: @user.password.to_s
    find("input[type='submit']").click

    @group1 = Group.new(name: 'first Group', icon: 'first icon', user_id: @user.id)
    @group1.save
  end

  it 'shows the view button' do
    visit groups_path
    expect(page).to have_content('View')
  end

  it 'shows the the title text' do
    visit groups_path
    expect(page).to have_content('All Catagories')
  end

  it 'should show the details' do
    visit groups_path
    click_link('View')
    expect(page.current_path).to eql(group_path(@group1))
  end

  it 'shows the user name' do
    expect(page).to have_content(@user.name.to_s)
  end

  it 'shows the Logo in the navbar' do
    expect(page).to have_content('Zee App')
  end

  it 'shows the Catagoies in the navbar' do
    expect(page).to have_content('Catagoies')
  end

  it 'shows the catagory name' do
    visit groups_path
    expect(page).to have_content(@group1.name.capitalize.to_s)
  end

  it 'shows the total amount' do
    visit groups_path
    expect(page).to have_content('Total Amount :-')
  end

  it 'shows the footer' do
    visit groups_path
    expect(page).to have_content('Copyright © Alzubair')
  end

  it 'shows the add new catagory button' do
    visit groups_path
    expect(page).to have_content('Add New Catagory')
  end
end
