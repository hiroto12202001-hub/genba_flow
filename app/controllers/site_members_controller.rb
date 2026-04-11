class SiteMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_site, only: [:edit, :update]

  def index
  end

  def edit
  end
  
  def update
    if @site.update(site_params)
      redirect_to @site, notice: 'Site members were successfully updated.'
    else
      render :edit
    end
  end

  private

  def site_params
    params.require(:site).permit(member_ids: [])
  end

  def set_site
    @site = Site.find(params[:site_id])
  end
end
