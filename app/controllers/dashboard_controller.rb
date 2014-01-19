class DashboardController < ApplicationController
  layout false

  def show
    if params[:filter] == "open"
      @posts = Post.open
    elsif params[:filter] == "completed"
      @posts = Post.completed
    else
      @posts = Post.all
    end
  end
end

