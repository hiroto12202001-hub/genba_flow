class HomeController < ApplicationController
  def top
    @sites = Site.all
  end

  def about
  end
end
