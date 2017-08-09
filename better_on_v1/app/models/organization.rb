class Organization < ActiveRecord::Base
    has_many :profiles, dependent: :destroy
    
    validates :organization_name, presence:true, uniqueness: { case_sensitive:false }, 
                    length: { minimum: 3, maximum: 25}
end