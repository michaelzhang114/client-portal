class CommentsController < ApplicationController
    
    def new
       @comments = Comment.new
    end
   
   def index
      @comments = Comment.order(:created_at)
   end
   
   def create
      @comments = Comment.new(comment_params)
      if @comment.save
         flash[:notice] = "Comment was created"
         redirect_to profile_path(current_profile)
      else
         render 'new'
      end
      @comment.save
   end
   
   def show
      @comment = Comment.find(params[:id])
   end
   
   def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to profile_path(current_profile)
   end
   
   def edit
      @comment = Comment.find(params[:id])
   end
    
   def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
         flash[:notice] = "comment was successfully updated"
         redirect_to profile_path(current_profile)
      else
         render 'edit'
      end
   end
    
    
    
end