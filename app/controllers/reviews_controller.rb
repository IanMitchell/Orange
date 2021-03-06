class ReviewsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_post, except: [:index]

  def index
    @review = Review.all
  end

  def show
  end

  def new
    @page_title = 'Add Review'
    @review = Review.new
  end

  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @post.user_id != current_user.id
      @review.reviewee_id = @post.user_id
    else
      @review.reviewee_id = @post.buyer_id
    end
    if @review.save
        flash[:notice] = "Review Created"
        redirect_to root_path
    else
        flash[:alert] = "Review Not Created"
        render 'new'
    end
  end

  def update
    if @review.update(review_params)
          flash[:notice] = "Review Updated"
          redirect_to :action => 'show', :id => @review
    else
          flash[:alert] = "Review Not Updated"
          render :action => 'edit'
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def review_params
      params.require(:review).permit(:title, :feedback, :score, :post_id, :reviewee_id).merge(post_id: @post.id)
  end

end
