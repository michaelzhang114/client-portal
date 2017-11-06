class VideosController < ApplicationController
    
    before_action :require_admin, only: [:new, :create, :destroy, :edit]
    #before_action :require_same_profile, only: [:update]
    
    # @post = Post.find params[:post_id]
    # @comment = Comment.new(:post=>@post)
    
    def new
        @session = Session.find(params[:session_id])
        @video = Video.new(:session => @session)
    end
    
    def create
        @session = Session.find(params[:session_id])
        @video = @session.videos.new(video_params)
        
        if @video.save
            flash[:notice] = "video was created"
            redirect_to session_path(@video.session_id)
        else
            render 'new'
        end
        @video.save
        #redirect_to sessions_show(@sesh)
        
    end
    
    def destroy
        @session = Session.find(params[:session_id])
        @video = Video.find(params[:id])
        @video.destroy
        flash[:notice] = "video was successfully deleted"
        redirect_to sessions_path
    end
    
    
    private
    def video_params
      params.require(:video).permit(:heading, :link, :session_id)
    end
    
    def require_same_profile
         if current_profile != @video.session_id.profile_id and !current_profile.admin?
           flash[:danger] = "You do not have access"
           redirect_to root_path
         end
    end
    
    # def parse_youtube(url)
    #   regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
    #   url.match(regex)[1]

    # end
    
   
                    
    
end