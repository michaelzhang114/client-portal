class Profile < ActiveRecord::Base
    
    #Associations
    belongs_to :organization
    has_many :sessions, dependent: :destroy
  
  
    #Validations
    validates :name, presence:true, length: { minimum: 3, maximum: 50 }
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:true, length: { maximum:105 },
                uniqueness: { case_sensitive: false },
                format: { with: VALID_EMAIL_REGEX }
    
    validates :organization_id, presence: true
    
    #Authentications
    has_secure_password
    
    #Avatar
    mount_uploader :avatar, AvatarUploader
    
end