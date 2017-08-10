class SessionsController < ApplicationController
    def new
        @sesh = Session.new
        
    end
    
    def create
        @sesh = Session.new(session_params)
        
        # if @sesh.save
        #     flash[:notice] = "Session was created"
        #     redirect_to sessions_path(@sesh)
        # else
        #     render 'new'
        # end
        @sesh.save
        
    end
    
    
    private
    def session_params
      params.require(:session).permit(:profile_id, :highlights, :feedback, :homework)
    end

    
end