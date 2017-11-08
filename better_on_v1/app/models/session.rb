class Session < ActiveRecord::Base
    
   #Associations
   belongs_to :profile
   has_many :videos
   
   has_many :comments
   
   #Validations
   #validates :highlights, presence:true, length: { minimum: 3 }
   
   VALID_YOUTUBE_REGEX = /http(?:s?):\/\/(?:www\.)?youtu(?:be\.com\/watch\?v=|\.be\/)([\w\-\_]*)(&(amp;)?‌​[\w\?‌​=]*)?/

    validates :feedback, presence:true, length: { minimum: 3 }, format: { with: VALID_YOUTUBE_REGEX }
   
   validates :profile_id, presence:true
   
   
   
    
end