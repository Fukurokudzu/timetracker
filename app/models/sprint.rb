class Sprint < ApplicationRecord
  belongs_to :task
  # TODO: consider broadcast_replace_later

  # after_update_commit { broadcast_replace }
  # after_create_commit { broadcast_prepend_to(task, :sprints) }

  # @user = "USER"

  # def sprint_stream_name
    # "sprints_" + self.task_id.to_s
  # end
end
