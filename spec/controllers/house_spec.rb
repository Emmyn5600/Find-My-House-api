require 'rails_helper'

describe 'houses managment validation', type: :feature do
  it 'should not save a house without the name' do
    user = User.create(name: 'emmy', email: 'emmy@gmail.com', password: 'password')
    house = House.new(description: 'this is the description of the house', user_id: user.id, price: '$200')
    expect(house.save).to be(false)
  end
end