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
    visit 'profile/1/new/tansaction'
    within('form') do
      fill_in 'name', with: 'xyz'
      fill_in 'amount', with: '12'
    end
    click_button 'submit'
    visit 'profile/51/all/transactions'
    expect(page).to have_content 'xyz'
  end
end
