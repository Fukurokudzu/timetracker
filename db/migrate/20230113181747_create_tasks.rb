class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.time :duration
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
