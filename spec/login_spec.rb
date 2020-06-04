require 'rails_helper'
require 'capybara/rspec'
describe 'User controller and view spec', type: :feature do
  before :each do
    a = User.new(name: 'gajksj', email: 'user@example.com', password: 'password1234')
    a.save
  end
  it 'login' do
    visit '/user/login'
    within('form') do
      fill_in 'email', with: 'user@example.com'
      fill_in 'password', with: 'password1234'
    end
    click_button 'commit'
    expect(page).to have_content 'user@example.com'
  end
  it 'sign up' do
    visit '/user/new'
    within('form') do
      fill_in 'name', with: 'user1'
      fill_in 'email', with: 'user1@example.com'
      fill_in 'password', with: 'password1234'
      fill_in 'cpassword', with: 'password1234'
    end
    click_button 'commit'
    expect(page).to have_content 'user1'
  end
end
