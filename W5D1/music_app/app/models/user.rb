class User < ApplicationRecord

  validates :email, :password, presence: true

  attr_reader :password
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    if u = User.find_by(email: email)
      u.is_password?(password) ? u : nil
    else
      nil
    end
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save
    session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
    @password = pass
  end

  def is_password?(maybe_pass)
    BCrypt::Password.new(self.password_digest).is_password?(maybe_pass)
      # BCrypt::Password.create(maybe_pass)
  end
end
