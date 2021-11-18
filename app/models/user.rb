class User < ApplicationRecord
  has_secure_password
  acts_as_paranoid
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  # The available roles
  ROLES = %w[admin default].freeze

  def is?(requested_role)
    self.role == requested_role.to_s
  end
end
