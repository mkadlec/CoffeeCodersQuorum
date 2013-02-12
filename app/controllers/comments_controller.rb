class CommentsController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @comment = @conversation.comments.create(params[:comment])
    @comment.update_attributes(:user_id => current_user ? current_user.id : nil)
    
    render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
  end

   def destroy
    @conversation = Conversation.find(params[:conversation_id])
    @comment = @conversation.comments.find(params[:id])
    @comment.destroy
    
    respond_to do |format|
      format.js { render "destroy"}
    end

    
  end
end
