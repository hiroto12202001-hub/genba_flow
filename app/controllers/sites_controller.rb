class SitesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      redirect_to @site, notice: 'Site was successfully created.'
    else
      render :new
    end

  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to @site, notice: 'Site was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_url, notice: 'Site was successfully deleted.'
  end

  private

  def site_params
    params.require(:site).permit(:name, :address, :end_date, :start_date)
  end

  def correct_user
    @site = current_user.sites.find_by_id(params[:id])
    redirect_to root_path unless @site
  end
end
