class RemoveStartFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :start, :datetime
  end
end
