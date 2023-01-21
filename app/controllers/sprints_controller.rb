class SprintsController < ApplicationController

  before_action :get_task
  before_action :get_user

  def index
    @sprints = Sprint.where(task: sprint_params[:task_id]).order(created_at: :desc)
  end

  def create
    @sprint = Sprint.new(sprint_params)
    @sprint.start = Time.now

    respond_to do |format|
      if @sprint.save
        format.turbo_stream
      end
    end

    # TODO: Flash messages for sprint save
    # if @task.save
      # flash.now[:success] = t('flash.notice.tasks.created', task_title: @task.title)
      # render turbo_stream: turbo_stream.update("flash", partial: "layouts/flash")
    # else
      # flash.now[:error] = t('flash.alert.tasks.title_empty', task_title: @task.title)
      # render turbo_stream: turbo_stream.update("flash", partial: "layouts/flash")
    # end
  end

  def update
    # TODO: check sprint access
    @sprint = Sprint.find(params[:id])
    @sprint.end = Time.now
    @sprint.duration = get_duration(@sprint)
    respond_to do |format|
      if @sprint.save
        format.turbo_stream
      end
    end
  end

  private
  
  def get_task
    @task = Task.find(sprint_params[:task_id])
  end

  def get_user
    @user = current_user
  end

  # FIXME: should use this here instead of views
  def to_user_tz
    self.in_time_zone(current_user.timezone)
  end

  def get_duration(sprint)
    sprint.end.to_i - sprint.start.to_i
  end

  def sprint_params
    params.permit(:start, :end, :duration, :task_id)
  end
end
