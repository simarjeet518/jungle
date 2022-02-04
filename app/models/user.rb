class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password,:length => {:within => 6..40}
 
  def check_confirm_password
    if password_confirmation != password
      errors.add(:password, "confrimation failed") 
    end
  end
end
