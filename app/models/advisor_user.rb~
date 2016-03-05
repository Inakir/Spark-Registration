class AdvisorUser < ActiveRecord::Base
  before_save { self.username = username.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, length: {maximum: 255}, 
  			format: { with: VALID_EMAIL_REGEX }, 
			uniqueness: { case_sensitive: false }

<<<<<<< HEAD
  #validates :first_name, presence: true, length: {maximum: 60}
  #validates :last_name, presence: true, length: {maximum: 60}
  #validates :school_name, presence: true, length: {maximum: 100}
  #validates :school_level, presence: true, #length: {maximum: 60}, 
  #			inclusion: { in: %w(Elementary Middle High), message: "%{value} is not a valid school type" }
=======
  validates :first_name, presence: true, length: {maximum: 60}
  validates :last_name, presence: true, length: {maximum: 60}
  validates :school_name, presence: true, length: {maximum: 60}
  validates :school_level, presence: true, #length: {maximum: 60}, 
  			inclusion: { in: %w(Elementary Middle High), message: "%{value} is not a valid school level must be Elementary, Middle, or High " }
>>>>>>> redobackend
  #validates :pay_code, presence: true, length: {maximum: 100}

  has_secure_password
  validates :password, length: { minimum: 6 }
end
