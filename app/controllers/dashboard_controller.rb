class DashboardController < ApplicationController
  layout false

  def show
    if params[:filter] == "open"
      @posts = current_user.posts.open
    elsif params[:filter] == "completed"
      @posts = current_user.posts.completed
    elsif params[:filter] == "all"
      @posts = current_user.posts
    else
      @posts = Post.all
    end
  end
end

