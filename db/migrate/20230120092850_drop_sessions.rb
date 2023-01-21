class DropSessions < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :sessions, :tasks
  end
end
