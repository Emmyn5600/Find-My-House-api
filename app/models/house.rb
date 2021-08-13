class House < ApplicationRecord
  validate :name presence :true
  validate :description presence :true
  validate :price presence :true
  validate :image presence :true
  belongs_to :user
end
