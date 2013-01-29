class CommentsController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @comment = @conversation.comments.create(params[:comment])
    @comment.update_attributes(:user_id => current_user.id)
    redirect_to conversation_path(@conversation)
  end

   def destroy
    @conversation = Conversation.find(params[:conversation_id])
    @comment = @conversation.comments.find(params[:id])
    @comment.destroy
    redirect_to conversation_path(@conversation)
  end
end
