class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects.order(created_at: :desc)
    @stream_name = "projects_" + current_user.id.to_s
  end

  def create
    @project = Project.new(project_params)

    @project.user_id = current_user.id

    if @project.save
      show_flash(t('flash.notice.projects.created', project_title: @project.title))
    else
      show_flash(:error, t('flash.alert.projects.title_empty', project_title: @project.title))
    end
  end

  def destroy
    #TODO: check removal of foreign users tasks

    @project = Project.find(params[:id])
    if @project.user_id = current_user.id
      @project.destroy
      show_flash(t('flash.notice.projects.removed', project_title: @project.title))
    else
      show_flash(:error, t('flash.alert.projects.destroy_error', project_title: @project.title))
    end
  end

  def show
  end

  def stream_name
    @project.stream_name = "projects_" + current_user.id
  end

  private

  def project_params
    params.permit(:title, :desc, :salary_per_hour, :salary_per_hour_currency)
  end

end
