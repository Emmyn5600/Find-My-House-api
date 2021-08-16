class User < ApplicationRecord
  before_create :set_user_not_admin

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  has_many :houses, foreign_key: :user_id, dependent: :destroy
  has_many :rents, dependent: :destroy
  has_many :rent_houses, through: :rents, source: :house

  def set_user_not_admin
    self.is_admin = false
  end
end
