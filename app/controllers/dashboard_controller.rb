class DashboardController < ApplicationController
  layout false

  def show
  	@posts =Post.all
  end
end

