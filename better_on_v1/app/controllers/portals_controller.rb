class PortalsController < ApplicationController
    def new
        
    end
    
    def create
        profile = Profile.find_by(email: params[:portal][:email].downcase)
        if profile && profile.authenticate(params[:portal][:password])
            session[:profile_id] = profile.id
            #flash[:success] = "logged in"
            redirect_to profile_path(profile)
        else
            flash.now[:danger] = "Invalid email/password"
            render 'new'
        end
    end
    
    def destroy
        session[:profile_id] = nil
        #flash[:success] = "logged out"
        redirect_to root_path
    end
end