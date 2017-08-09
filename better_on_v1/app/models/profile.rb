class Profile < ActiveRecord::Base
    belongs_to :organization
  
    validates :name, presence:true, length: { minimum: 3, maximum: 50 }
    
    
    
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
    validates :email, presence:true, length: { maximum:105 },
                uniqueness: { case_sensitive: false },
                format: { with: VALID_EMAIL_REGEX }
end