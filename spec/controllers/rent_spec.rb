require 'rails_helper'

describe 'the rent feature', type: :feature do
    it 'should add to rents a house if user_id is passed' do
        user = User.new(name: 'emmy', email: 'emmy@gmail.com', password: 'password',
            password_confirmation: 'password')
      house = House.create(name: 'house1', price: '$400', description: 'this is the description of the house',
                             user_id: user.id)
      rent = Rent.new(house_id: house.id, user_id: user.id)
      expect(rent.save).to be(true)
    end
end