class DashboardController < ApplicationController
  layout false

  def show
    if params[:filter] == "open"
      @posts = Post.where(created_by: current_user).open.order('created_at DESC')
      #@posts = current_user.posts.open
      #@posts.zip(Post.where(buyer: current_user).open).flatten.compact
   elsif params[:filter] == "completed"
      #@posts = current_user.posts.completed
      @posts = Post.where(created_by: current_user).completed.order('created_at DESC')
      #@posts.zip(Post.where(buyer: current_user).completed).flatten.compact
    elsif params[:filter] == "all"
      @posts = Post.where(created_by: current_user).order('created_at DESC')
      #@posts.zip(Post.where(created_by: current_user)).flatten.compact
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
end

