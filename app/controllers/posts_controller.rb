class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    @post.save
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  def connect
    @post = Post.find(params[:id])

    if @post.user
      @post.buyer=current_user
    else
      @post.user=current_user
    end

    @post.status = :completed

    redirect_to dashboard_path
  end
end
