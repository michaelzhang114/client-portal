class Session < ActiveRecord::Base
    
   #Associations
   belongs_to :profile
   has_many :videos
   
   #Validations
   #validates :highlights, presence:true, length: { minimum: 3 }
   validates :feedback, presence:true, length: { minimum: 3 }
   validates :profile_id, presence:true
   
   
   
    
end