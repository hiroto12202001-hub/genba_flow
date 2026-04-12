class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  
  def index
  @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @site_section.tasks.build if @site_section.tasks.empty?
  end

  def update
    if @site_section.update(nested_task_params)
      redirect_to @site_section, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_site_section
    @site_section = SiteSection.find(params[:site_section_id])
  end

  def nested_task_params
    params.require(:site_section).permit(tasks_attributes: [:id, :user_id, :site_section_id, :importance, :urgency, :start_time, :end_time, :status, :title, :description, :_destroy])
  end

  def correct_user
    @site_section = SiteSection.find_by(id: params[:site_section_id])
    site = @site_section&.site
    if !site || !(current_user.admin?(site) || current_user.editor?(site))
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end 
  end
end
