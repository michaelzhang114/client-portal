class SessionsController < ApplicationController
    
    before_action :require_admin, only: [:new, :index, :create, :destroy, :edit]
    #before_action :require_same_profile, only: [:update]
    
    
    def new
        @session = Session.new
    end
    
    def index
        @sessions = Session.all
    end
    
    def create
        @session = Session.new(session_params)
        
        if @session.save
            flash[:notice] = "Session was created"
            redirect_to session_path(@session)
        else
            render 'new'
        end
        @session.save
        #redirect_to sessions_show(@sesh)
        
    end
    
    def destroy
        @session = Session.find(params[:id])
        @session.destroy
        flash[:notice] = "Article was successfully deleted"
        redirect_to sessions_path
    end
    
    def show
        @session = Session.find(params[:id])
        
    end
    
    def edit
        @session = Session.find(params[:id])
    end
    
    def update
        @session = Session.find(params[:id])

        if @session.update(session_params)
            flash[:notice] = "session was successfully updated"
            redirect_to session_path(@session)
        else
            render 'edit'
        end

    end
    
    
    private
    def session_params
      params.require(:session).permit(:profile_id, :highlights, :feedback, :homework, :show_group)
    end
    
    def require_same_profile
         if current_profile != @session.profile_id and !current_profile.admin?
           flash[:danger] = "You do not have access"
           redirect_to root_path
         end
    end
    
    # def parse_youtube(url)
    #   regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
    #   url.match(regex)[1]

    # end
    
   
                    
    
end