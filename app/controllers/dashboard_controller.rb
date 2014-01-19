class DashboardController < ApplicationController
  layout false

  def show
    if params[:filter] == "open"
      @posts = current_user.posts.openorder('created_at DESC')
      @posts.zip(Post.where(buyer: current_user).open.order('created_at DESC')).flatten.compact
   elsif params[:filter] == "completed"
      @posts = current_user.posts.completedorder('created_at DESC')
      @posts.zip(Post.where(buyer: current_user).completed.order('created_at DESC')).flatten.compact
    elsif params[:filter] == "all"
      @posts = current_user.posts.order('created_at DESC')
      @posts.zip(Post.where(buyer: current_user).order('created_at DESC')).flatten.compact
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
end

