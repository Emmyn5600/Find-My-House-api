class User < ApplicationRecord
  before_create :set_user_not_admin

  has_secure_password
  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :email, uniqueness: true, presence: true, length: { minimum: 13, maximum: 250 },
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, presence: true, length: { minimum: 6, maximum: 250 }
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 250 }
  has_many :houses, foreign_key: :user_id, dependent: :destroy
  has_many :rents, dependent: :destroy
  has_many :rent_houses, through: :rents, source: :house

  def set_user_not_admin
    self.is_admin = false
  end
end
