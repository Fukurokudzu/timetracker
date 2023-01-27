class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  after_update_commit { broadcast_replace }
  after_create_commit { broadcast_prepend_to(stream_name, target: stream_name) }
  after_destroy_commit { broadcast_remove }

  validates :title, presence: true
  
  monetize :salary_per_hour_cents,   
    numericality: {
    greater_than_or_equal_to: 0
  }

  def salary
    amount = project_seconds_spent * self.salary_per_hour_cents / 3600
    Money.new(amount, self.salary_per_hour_currency)
  end

  def project_seconds_spent
    accumulator = 0
    self.tasks.all.each do |task|
      accumulator += task.sprints.all.sum(:duration)
    end
    accumulator
  end

  def stream_name
    "projects_" + self.user_id.to_s
  end

end
