class ProfilesController < ApplicationController
   def new
       @profile = Profile.new
   end
   
   def index
      @profiles = Profile.order(:organization_id)
   end
   
   def create
      @profile = Profile.new(profile_params)
      if @profile.save
         flash[:notice] = "Profile was created"
         redirect_to profile_path(@profile)
      else
         render 'new'
      end
      @profile.save
   end
   
   def show
      @profile = Profile.find(params[:id])
   end
   
   def destroy
      @profile = Profile.find(params[:id])
      @profile.destroy
      flash[:notice] = "Profile was successfully deleted"
      redirect_to profiles_path
   end
   
   def edit
      @profile = Profile.find(params[:id])
   end
    
   def update
      @profile = Profile.find(params[:id])
      if @profile.update(profile_params)
         flash[:notice] = "Article was successfully updated"
         redirect_to profile_path(@profile)
      else
         render 'edit'
      end

   end
   
   
   private
      def profile_params
         params.require(:profile).permit(:name, :email, :password, :organization_id, :avatar)
      end
    
end