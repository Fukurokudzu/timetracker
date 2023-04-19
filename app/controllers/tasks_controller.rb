class TasksController < ApplicationController
  #TODO: - alert for wrong project_id

  before_action :get_user

  def index

    @projects = current_user.projects
    @current_project = @projects.find(task_params[:project_id])

    @tasks = @current_project.tasks.order(created_at: :desc)
    @stream_name = "tasks_" + @current_project.id.to_s
    
  end

  def create
    @task = Task.new(task_params)

    if project_id_owner?(task_params[:project_id])
      if @task.save
        show_flash(t('flash.notice.tasks.created', task_title: @task.title))
      else
        show_flash(:error, t('flash.alert.tasks.title_empty', task_title: @task.title))
      end
    end
  end

  def destroy
    #TODO: check removal of foreign users tasks
    @task = Task.find(params[:id])
    if project_id_owner?(task_params[:project_id])
      @task.destroy
      show_flash(t('flash.notice.tasks.removed', task_title: @task.title))
    else
      show_flash(:error, t('flash.alert.tasks.destroy_error', task_title: @task.title))
    end
  end

  def show
  end

  private

  def get_user
    @user = current_user
  end

  def project_id_owner?(project_id)
    current_user.id ==  Project.find(project_id).user_id
  end

  def task_params
    params.permit(:title, :start, :end, :duration, :project_id)
  end

end
