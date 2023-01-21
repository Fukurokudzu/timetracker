class RenameSessions < ActiveRecord::Migration[7.0]
  def change
    rename_table :sessions, :sprints
  end
end
