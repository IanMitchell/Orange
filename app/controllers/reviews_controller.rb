class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @page_title = 'Add Movie'
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.create(review_params)
  
    if @review.save
        flash[:notice] = "Review Created"
        redirect_to posts_path
    else
        flash[:alert] = "Review Not Created"
        render 'new'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
          flash[:notice] = "Review Updated"
          redirect_to :action => 'show', :id => @review
      else
          flash[:alert] = "Review Not Updated"
          render :action => 'edit'
      end
  end
  def review_params
      params.require(:review).permit(:title, :feedback, :post_id, :user_id, :ownder_id, :score)
  end
end
