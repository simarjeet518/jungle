class User < ActiveRecord::Base
 has_secure_password
 
  before_validation :downcase_email
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true , uniqueness: true
  validates :password,:length => {:within => 6..40}
 
  def check_confirm_password
    if password_confirmation != password
      errors.add(:password, "confrimation failed") 
    end
  end

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    end
  end


end
