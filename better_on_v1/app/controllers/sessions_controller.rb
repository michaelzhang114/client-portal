class SessionsController < ApplicationController
    def new
        @sesh = Session.new
        
    end
    
    def create
        @sesh = Session.new(session_params)
        
        if @sesh.save
            flash[:notice] = "Session was created"
            redirect_to session_path(@sesh)
        else
            render 'new'
        end
        @sesh.save
        #redirect_to sessions_show(@sesh)
        
    end
    
    def show
        @sesh = Session.find(params[:id])
    end
    
    
    private
    def session_params
      params.require(:session).permit(:profile_id, :highlights, :feedback, :homework)
    end

    
end