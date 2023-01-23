class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  after_update_commit { broadcast_replace }
  after_create_commit { broadcast_prepend_to(stream_name, target: stream_name) }
  after_destroy_commit { broadcast_remove }

  validates :title, presence: true
  
  def project_salary
    project_time_spent * (self.salary_per_hour / 60).truncate(2)
  end

  def project_time_spent
    tmp = 0
    self.tasks.all.each do |task|
      tmp += task.sprints.all.sum(:duration)
    end
    tmp / 60
  end

  def stream_name
    "projects_" + self.user_id.to_s
  end
  
end
