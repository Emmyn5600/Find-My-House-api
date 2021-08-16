class User < ApplicationRecord
  has_secure_password
  has_many :houses
  has_many :rents
end
