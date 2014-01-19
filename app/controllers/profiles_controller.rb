class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def connect
  	@post = Post.find(params[:id])

  	if @post.user 
  		@post.buyer=current_user
  	else
  		@post.user=current_user
  	end

  	@post.staus= :completed

  	redirect_to dashboard_show_path
  end
end
