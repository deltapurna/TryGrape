class User < ActiveRecord::Base
  has_many :tasks

  has_secure_password

  before_create :set_authentication_token

  def set_authentication_token
    self.authentication_token = loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(authentication_token: token)
    end
  end
  
  def as_json(options={})
    super(except: [:password_digest, :created_at, :updated_at])
  end
end
