class HomeController < ApplicationController
  layout nil

  def index
  	if user_signed_in?
      redirect_to dashboard_show_path
  	end
  end
end
