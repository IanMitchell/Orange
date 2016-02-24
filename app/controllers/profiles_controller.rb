class ProfilesController < ApplicationController
	layout false

  def show
    @user = User.find(params[:id])
    @posts = Post.where(created_by: @user)
    @reviews = Review.where(reviewee: @user)
  end
end
