class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.datetime :start
      t.datetime :end
      t.time :duration
      t.integer :task_id

      t.timestamps
    end
  end
end
