class StudentUser < ActiveRecord::Base
  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |student|
      csv << student.attributes.values_at(*column_names)

    end
  end
end
        
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, 
  			format: { with: VALID_EMAIL_REGEX }, 
			uniqueness: { case_sensitive: false }

  validates :first_name, presence: true, length: {maximum: 60}
  validates :last_name, presence: true, length: {maximum: 60}
  validates :school_name, presence: true, length: {maximum: 60}
  validates :school_level, presence: true, #length: {maximum: 60}, 
  			inclusion: { in: %w(Elementary Middle High), message: "%{value} is not a valid school level must be Elementary, Middle, or High " }
  has_secure_password
 # validates :password, length: { minimum: 6 }, confirmation: true
  #validates_confirmation_of :password

  
end
