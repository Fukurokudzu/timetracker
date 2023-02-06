class ChangeDataTypeForSessionsDuration < ActiveRecord::Migration[7.0]
  def change
    change_column(:sessions, :duration, 'integer USING CAST(column_name AS integer)')
  end
end
