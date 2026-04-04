class TasksController < ApplicationController
  before_action :set_site_section, only: [:edit, :update]

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
end

