class User < ActiveRecord::Base
  has_secure_password

  validates :fname, :lname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 10 }
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip.downcase)
    @user && @user.authenticate(password) ? @user : nil
  end
end
