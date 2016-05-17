class User < ActiveRecord::Base
#add these 2 lines
has_many :articles
before_save { self.email = email.downcase }
    validates :username, 
    presence: true, 
    uniqueness: {case_sensitive: false},
    length: {minimum: 3, maximum: 25}

#tested in rubular regex isn't perfect but it works
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    
    validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: {with: VALID_EMAIL_REGEX }
    
has_secure_password
end
