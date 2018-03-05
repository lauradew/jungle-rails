class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates_presence_of :first_name, :last_name, :password, :password_confirmation
  # validates :password, presence: true, confirmation: true
  validates_length_of :password, minimum: 6

  def self.authenticate_with_credentials(email, password)
    email_auth = email.squish.downcase
    @user = User.find_by_email(email_auth)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end