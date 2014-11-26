class User < ActiveRecord::Base

  has_many :reviews

  has_secure_password
  #adds a "virtual" attribute to the model, 
  # one that does not get saved in the database. 
  # Don't want to store the user's plain text 
  # password in our db (security issue). 
  # We only store the digested version

  validates :email,
    presence: true

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true

  validates :password, 
    length: {in: 6..20}, on: :create

    def full_name
      "#{firstname} #{lastname}"
    end
end
