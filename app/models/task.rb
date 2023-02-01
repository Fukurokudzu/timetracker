class Task < ApplicationRecord
  belongs_to :project
  has_many :sprints, dependent: :destroy

  after_update_commit { broadcast_replace }
  after_create_commit { broadcast_prepend_to(stream_name, target: stream_name) }
  after_destroy_commit { broadcast_remove }

  validates :title, presence: true

  def time_spent
    self.sprints.all.sum(:duration)/60
  end

  def stream_name
    "tasks_" + self.project_id.to_s
  end

  def task_active?
    return false if self.sprints.all.empty?
    self.sprints.all.each do | sprint |
      return true if sprint.end.nil?
    end
    return false
  end
end
