require 'rails_helper'

RSpec.describe House, type: :model do
  it { should have_many(:rents) }
  it { should belong_to(:user).class_name('User') }
  it { should validate_length_of(:name) }
  it { should validate_length_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:image) }
end
