class Comment < ActiveRecord::Base
#   has_many :session, dependent: :destroy
#   has_many :profile, dependent: :destroy

    belongs_to :session
    belongs_to :profile
   
   validates :text, presence:true, length: { minimum: 10, maximum: 1000 }
   validates :session_id, presence: true
   validates :profile_id, presence: true
   
   
end