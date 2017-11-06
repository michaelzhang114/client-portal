class Video < ActiveRecord::Base
    
    
    #Associations
    belongs_to :session
    
    
    
    #Validations
    validates :heading, presence:true, length: { minimum: 3 }
    VALID_YOUTUBE_REGEX = /\Ahttps?:\/\/(?:www\.)?youtube.com\/watch\?(?=.*v=\w+)(?:\S+)?\z/
    validates :link, presence:true, length: { minimum: 3 }, format: { with: VALID_YOUTUBE_REGEX }
    validates :session_id, presence:true
    
    
    
end
