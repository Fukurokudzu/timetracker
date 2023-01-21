class RemoveDurationFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :duration, :time
  end
end
