class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  def self.authenticate_with_credentials(email, password)

    user = User.find_by_email(email.delete(' '))
    # If the user exists AND the password entered is correct.
  
    if user && user.authenticate(password.delete(' '))
      return user
    else
      return nil
    end
  end



  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
end


