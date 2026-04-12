class SitesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @page_title = "すべての現場"
    @sites = Site.all
  end

  def admin_index
    @page_title = "管理者になっている現場"
    @sites = current_user.admin_sites
    render :index
  end

  def editor_index
    @page_title = "編集者になっている現場"
    @sites = current_user.editor_sites
    render :index
  end

  def show
    @site = Site.find(params[:id])
    @site_sections = @site.site_sections.includes(:tasks)
  end

  def tasks
    @site = Site.find(params[:id])
    @tasks = Task.joins(site_section: :site).where(sites: { id: @site.id })
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
