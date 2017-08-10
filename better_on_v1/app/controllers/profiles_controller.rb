class ProfilesController < ApplicationController
    
   def new
       @person = Profile.new
   end
    
end