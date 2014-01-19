class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(params[:review])
  end

  def update
    @review = Review.find(params[:id])
    @review.update_attributes(params[:review])
  end
end
