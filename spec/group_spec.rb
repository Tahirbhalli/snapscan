require 'rails_helper'
require 'capybara/rspec'
describe 'Post controller and view spec', type: :feature do
  before :each do
    User.create(name: 'abc', email: 'abc@gmail.com', password: '123')
    visit '/user/login'
    within('form') do
      fill_in 'email', with: 'abc@gmail.com'
      fill_in 'password', with: '123'
    end
    click_button 'commit'
    a = User.find(1)
    a.groups.create(name: 'home')
    a.transactins.create(name: 'abc')
  end
  it 'see group' do
    click_link 'All Groups'
    expect(page).to have_content 'home'
  end
  it 'see transactions' do
    click_link 'All Groups'
    click_link 'Add Transactions'
    expect(page).to have_content 'abc'
  end
  it 'leave group' do
    click_link 'All Groups'
    click_link 'Leave'
    expect(page).to have_no_content('Add Transactions')
  end
  it 'Add transactions' do
    click_link 'All Groups'
    click_link 'Add Transactions'
    click_link 'Join'
    click_link 'home'
    expect(page).to have_content 'abc'
  end
  it 'logout' do
    click_link 'Logout'
    expect(page).to have_content 'login'
  end
end
# path = 'path/to/fixture_file'
# params = { 'file' => Rack::Test::UploadedFile.new(path, 'application/pdf', true) }
# post v1_product_documents_path, params: params
