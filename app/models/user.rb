class User < ApplicationRecord
  has_secure_password
  acts_as_paranoid
  has_many :messages, through: :chat

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
