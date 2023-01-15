class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :desc
      t.float :salary_per_hour
      t.references :user
      t.timestamps
    end
  end
end
