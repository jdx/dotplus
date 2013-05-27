class PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    post.postable = postable
    post.user = current_user
    if post.save
      flash[:success] = "Posted message"
      redirect_to postable
    else
      render 'events/show'
    end
  end

  private
  def user
    @user ||= User.find_by_twitter(params[:user_id])
  end

  def event
    @event ||= Event.find_by_id(params[:event_id])
  end
  
  def postable
    event || user
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
