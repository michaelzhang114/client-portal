class OrganizationsController < ApplicationController
   def index
       @organizations = Organization.order(:organization_name)
   end
   
   def new
       @organization = Organization.new
   end
   
   def show
      @organization = Organization.find(params[:id])
   end
   
   def destroy
      @organization = Organization.find(params[:id])
      @organization.destroy
      flash[:notice] = "Organization was successfully deleted"
      redirect_to organizations_path
   end
   
   def edit
      @organization = Organization.find(params[:id])
   end
    
   def update
      @organization = Organization.find(params[:id])
      if @organization.update(organization_params)
         flash[:notice] = "Organization was successfully updated"
         redirect_to organization_path(@organization)
      else
         render 'edit'
      end
   end
   
   def create
      @organization = Organization.new(organization_params)
      if @organization.save
         flash[:notice] = "Organization was created"
         redirect_to organization_path(@organization)
      else
         render 'new'
      end
      @organization.save
   end
   
   
   private
      def organization_params
         params.require(:organization).permit(:organization_name)
      end
   
    
    
end