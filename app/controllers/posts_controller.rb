class PostsController < ApplicationController
  respond_to :html, :js

  def index
    @posts = Post.all.order('created_at DESC')
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
    @post.created_by = current_user

    if params[:post]['give']
      @post.user = current_user
    else
      @post.buyer = current_user
    end

    @post.save

    respond_with @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])

    respond_with @post
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

    @post.save

    redirect_to dashboard_path
  end
end
