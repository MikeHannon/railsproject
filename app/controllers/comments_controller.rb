class CommentsController < ApplicationController
  def create
  	@user = current_user
  	@event = params['event_id']
  	@comment = Comment.create(content: params[:content], user_id: @user.id, event_id: @event)
  	if @comment.save
  		redirect_to "/events/#{@event}"
  	else
  		flash[:errors] = @comment.errors.full_messages
  		redirect_to "/events/#{@event}"
  	end
  end
end
