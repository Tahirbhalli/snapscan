require 'rails_helper'

RSpec.describe Transactin, type: :model do
  it 'user wrong email' do
    a = User.new(name: 'abc', email: 'abv', password: '123')
    a.save
    expect(User.exists?(email: 'abv')).to eq(false)
  end
  it 'user right email' do
    a = User.new(name: 'abc', email: 'abv@gmail.com', password: '123')
    a.save
    expect(User.exists?(email: 'abv@gmail.com')).to eq(true)
  end
  it 'auther join group default' do
    b = User.new(name: 'abc', email: 'abv@gmail.com', password: '123')
    b.save
    a = Group.new(user_id: 1, name: 'dumy')
    a.save
    expect(Particpent.exists?(group_id: a.id, user_id: 1)).to eql(true)
  end
end
