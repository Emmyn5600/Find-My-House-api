require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:houses) }
  it { should have_many(:rents) }
  it { should validate_length_of(:name) }
  it { should validate_length_of(:email) }
  it { should validate_length_of(:password) }
  it { should validate_length_of(:password_confirmation) }
end