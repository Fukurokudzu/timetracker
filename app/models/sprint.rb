class Sprint < ApplicationRecord
  belongs_to :task

  after_update_commit { broadcast_replace }
  after_create_commit { broadcast_prepend_to(stream_name, target: stream_name) }

  def stream_name
    "sprints_" + self.task_id.to_s
  end
end
