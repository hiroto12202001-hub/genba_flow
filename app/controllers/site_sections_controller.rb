class SiteSectionsController < ApplicationController
  before_action :set_site, only: [:edit, :update]

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

  def set_site
    @site = Site.find(params[:site_id])
  end

  def nested_site_section_params
    params.require(:site).permit(site_sections_attributes: [:id, :user_id, :site_id,:section_name, :_destroy])
  end
end
