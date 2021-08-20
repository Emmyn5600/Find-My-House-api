require 'rails_helper'

describe 'houses managment validation', type: :feature do
  it 'should not save a house without the name' do
    user = User.create(name: 'emmy', email: 'emmy@gmail.com', password: 'password')
    house = House.new(description: 'this is the description of the house', user_id: user.id, price: '$200')
    expect(house.save).to be(false)
  end

  it 'should not save a house without the description' do
    user = User.create(name: 'emmy', email: 'emmy@gmail.com', password: 'password')
    house = House.new(name:"house1", user_id: user.id, price: '$200')
    expect(house.save).to be(false)
  end

  it 'should not save a house without the price' do
    user = User.create(name: 'emmy', email: 'emmy@gmail.com', password: 'password')
    house = House.new(name: "house1", description: 'this is the description of the house', user_id: user.id)
    expect(house.save).to be(false)
  end

  it 'should save a house if all the information is passed' do
    user = User.create(name: 'emmy', email: 'emmy@gmail.com', password: 'password')
    house = House.new(name: 'house1', description: 'this is the description of the house', user_id: user.id, price: '$200')
    expect(house.name).to eql('house1')
  end

end