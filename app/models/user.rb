class User < ApplicationRecord
    has_many :houses
    has_many :rents
end
