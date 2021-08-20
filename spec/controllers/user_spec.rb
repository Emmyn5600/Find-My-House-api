require 'rails_helper'

describe 'the sign up process', type: :feature do
  it 'should not save user without the password confirmation' do
    user = User.new(name: 'emmy', email: 'emmy@gmail.com', password: 'password')
    expect(user.save).to be(false)
 end

 
end