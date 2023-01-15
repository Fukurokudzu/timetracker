class Project < ApplicationRecord
  belongs_to :user

  scope :owned, ->{ where(id: current_user.id) }
end
