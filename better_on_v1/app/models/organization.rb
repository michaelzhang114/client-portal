class Organization < ActiveRecord::Base
    #Associations
    has_many :profiles, dependent: :destroy
    
    #Validations
    before_save { self.organization_name = organization_name.downcase }
    validates :organization_name, presence:true, uniqueness: { case_sensitive:false }, 
                    length: { minimum: 3, maximum: 25}
    validates :organization_id, presence:true
end