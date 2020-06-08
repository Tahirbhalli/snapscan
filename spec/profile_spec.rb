require 'rails_helper'
require 'capybara/rspec'
describe 'Post controller and view spec', type: :feature do
  before :each do
    User.create(name: 'abc', email: 'abc@gmail.com', password: '123')
  end
  it 'create transaction' do
    visit '/user/login'
    within('form') do
      fill_in 'email', with: 'abc@gmail.com'
      fill_in 'password', with: '123'
    end
    click_button 'commit'
    click_link 'Create Transaction'
    within('form') do
      fill_in 'name', with: 'xyz'
      fill_in 'amount', with: '12'
    end
    click_button 'submit'
    click_link 'All My Transactions'
    expect(page).to have_content 'xyz'
  end
  it 'external transaction' do
    a = User.find(1)
    a.transactins.create(name: 'abcd')
    visit '/user/login'
    within('form') do
      fill_in 'email', with: 'abc@gmail.com'
      fill_in 'password', with: '123'
    end
    click_button 'commit'
    click_link 'All My External Transactions'
    expect(page).to have_content 'abcd'
  end
end
