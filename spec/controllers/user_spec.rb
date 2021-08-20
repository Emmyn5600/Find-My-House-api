require 'rails_helper'

describe 'the sign up process', type: :feature do
  it 'should not save user without the password confirmation' do
    user = User.new(name: 'emmy', email: 'emmy@gmail.com', password: 'password')
    expect(user.save).to be(false)
  end

  it 'should not save user without the password' do
    user = User.new(name: 'emmy', email: 'emmy@gmail.com')
    expect(user.save).to be(false)
  end

  it 'should not save user username less than 3 characters' do
    user = User.new(name: 'em', email: 'emmy@gmail.com', password: 'password',
                    password_confirmation: 'password')
    expect(user.save).to be(false)
  end

  it 'should save user with all fields' do
    user = User.new(name: 'emmy', email: 'emmy@gmail.com', password: 'password',
                    password_confirmation: 'password')
    user.save
    expect(user.name).to eq('emmy')
  end

  it 'should not save the user with a password less than 6 characters' do
    user = User.new(name: 'John', email: 'emmy@gmail.com', password: 'pass',
                    password_confirmation: 'pass')
    expect(user.save).to be(false)
  end
end
