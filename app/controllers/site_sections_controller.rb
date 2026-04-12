class SiteSectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def edit
    @site.site_sections.build if @site.site_sections.empty?
  end 

  def update
    if @site.update(nested_site_section_params)
      redirect_to @site, notice: 'Site section was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @site_section = SiteSection.find(params[:id])
  end

  private

  def nested_site_section_params
    params.require(:site).permit(site_sections_attributes: [:id, :user_id, :site_id,:section_name, :_destroy])
  end

  def correct_user
    @site = Site.find_by(id: params[:site_id])
    if !@site || !(current_user.admin?(@site) || current_user.editor?(@site))
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end 
  end
end
