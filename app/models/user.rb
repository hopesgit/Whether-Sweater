class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :api_key, uniqueness: true

  before_validation :update_api_key

  def update_api_key
    self.api_key = ApiKeyCreator.generate_api_key if self.api_key.nil?
  end
end
