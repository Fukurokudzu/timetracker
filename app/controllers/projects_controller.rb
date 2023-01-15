class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    render json: { success: @project.save, id: @project.id }
  end

  private

  def project_params
    params.permit(:title, :desc, :salary_per_hour)
  end
end
