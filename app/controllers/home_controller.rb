class HomeController < ApplicationController
  def top
    redirect_to sites_path if user_signed_in?
  end

  def about
  end
end
