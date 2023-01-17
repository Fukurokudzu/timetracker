class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects.order(created_at: :desc)
  end

  def create
    @project = Project.new(project_params)

    @project.user_id = current_user.id
    # render json: { success: @project.save, id: @project.id }
    if @project.save
      flash.now[:success] = t('flash.notice.projects.created', project_title: @project.title)
      render turbo_stream: turbo_stream.update("flash", partial: "layouts/flash")
    else
      flash.now[:error] = t('flash.alert.projects.title_empty', project_title: @project.title)
      render turbo_stream: turbo_stream.update("flash", partial: "layouts/flash")
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.user_id = current_user.id
      project.destroy
      render json: { success: project.save, id: project.id }
    else
      render json: { error: t('flash.alert.projects.destroy_error'), id: project.id }
      # flash.alert = t('flash.alert.projects.destroy_error')
    end
  end

  def show
  end

  private

  def project_params
    params.permit(:title, :desc, :salary_per_hour)
  end
end
