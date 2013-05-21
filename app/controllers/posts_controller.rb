class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    post.postable = event
    post.user = current_user
    if post.save
      flash[:success] = "Posted message"
      redirect_to event
    else
      render 'events/show'
    end
  end

  private
  def event
    @event ||= Event.find(params[:event_id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
