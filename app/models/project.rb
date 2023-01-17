class Project < ApplicationRecord
  belongs_to :user
  after_update_commit { broadcast_replace }
  after_create_commit { broadcast_prepend_to("projects") }
  after_destroy_commit { broadcast_remove }

  validates :title, presence: true
end
