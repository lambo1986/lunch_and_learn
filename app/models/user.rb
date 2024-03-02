class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  before_create :generate_api_key

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(10)
  end
end
