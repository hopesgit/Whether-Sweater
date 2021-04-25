class ApiKeyCreator
  def self.generate_api_key
    SecureRandom.urlsafe_base64(20, false)
  end
end
