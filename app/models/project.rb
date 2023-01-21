class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  after_update_commit { broadcast_replace }
  after_create_commit { broadcast_prepend_to(stream_name, target: stream_name) }
  after_destroy_commit { broadcast_remove }

  validates :title, presence: true

  def stream_name
    "projects_" + self.user_id.to_s
  end
  
end
