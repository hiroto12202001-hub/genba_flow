class SiteMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

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

  def correct_user
    @site = Site.find_by(id: params[:site_id])
    if !@site || !(current_user.admin?(@site) || current_user.editor?(@site))
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end 
  end
end
