class DashboardController < ApplicationController
  layout false

  def show
    if params[:filter] == "open"
<<<<<<< HEAD
      @posts = Post.where(created_by: current_user).open
      #@posts = current_user.posts.open
      #@posts.zip(Post.where(buyer: current_user).open).flatten.compact      
   elsif params[:filter] == "completed"
      #@posts = current_user.posts.completed
      @posts = Post.where(created_by: current_user).completed
      #@posts.zip(Post.where(buyer: current_user).completed).flatten.compact      
    elsif params[:filter] == "all"
      @posts = Post.where(created_by: current_user)
      #@posts.zip(Post.where(created_by: current_user)).flatten.compact      
=======
      @posts = current_user.posts.openorder('created_at DESC')
      @posts.zip(Post.where(buyer: current_user).open.order('created_at DESC')).flatten.compact
   elsif params[:filter] == "completed"
      @posts = current_user.posts.completedorder('created_at DESC')
      @posts.zip(Post.where(buyer: current_user).completed.order('created_at DESC')).flatten.compact
    elsif params[:filter] == "all"
      @posts = current_user.posts.order('created_at DESC')
      @posts.zip(Post.where(buyer: current_user).order('created_at DESC')).flatten.compact
>>>>>>> e98a5e4533c7a9f2e571f00cb5b2c19be4bcc134
    else
      @posts = Post.all.order('created_at DESC')
    end
  end
end

