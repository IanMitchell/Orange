class SearchController < ApplicationController
  def index
    if params[:query].present?
      @results = Array.new

      @posts = Post.search params[:query], partial: true
      @tags = Tag.search params[:query], partial: true

      @posts.each do |post|
        @results << post
      end

      add = true
      @tags.each do |tag|
        tag.posts.each do |tag_loc|
          @results.each do |loc|
            add = false if loc.name == tag_loc.name
          end
          @results << tag_loc if add
          add = true
        end
      end
    else
      @results = Post.all
    end
  end
end
