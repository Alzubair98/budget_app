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

    @tran1 = Entity.new(name: 'first entity', amount: 30, user_id: @user.id, group_id: @group1.id)
    @tran1.save
  end

  it 'shows the Transactions text' do
    visit group_path(@group1)
    expect(page).to have_content('Transactions')
  end

  it 'shows the the total amount text' do
    visit group_path(@group1)
    expect(page).to have_content('Total Amount :-')
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
    visit group_path(@group1)
    expect(page).to have_content(@tran1.name.capitalize.to_s)
  end

  it 'shows the catagory name' do
    visit group_path(@group1)
    expect(page).to have_content(@tran1.amount)
  end

  it 'shows the total amount time' do
    visit group_path(@group1)
    expect(page).to have_content('Amount:')
  end

  it 'shows the footer' do
    visit group_path(@group1)
    expect(page).to have_content('Copyright © Alzubair')
  end

  it 'shows the add new transaction button' do
    visit group_path(@group1)
    expect(page).to have_content('Add New Transaction')
  end
end
