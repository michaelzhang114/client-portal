class Video < ActiveRecord::Base
    
    
    #Associations
    belongs_to :session
    
    
    
    #Validations
    validates :heading, presence:true, length: { minimum: 3 }
    VALID_YOUTUBE_REGEX = /http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=|\.be\/)([\w\-\_]*)(&(amp;)?‌​[\w\?‌​=]*)?/

    validates :link, presence:true, length: { minimum: 3 }, format: { with: VALID_YOUTUBE_REGEX }
    validates :session_id, presence:true
    
    
    
end
