class RemoveEndFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :end, :datetime
  end
end
