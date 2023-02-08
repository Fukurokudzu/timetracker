class ChangeDataTypeForSessionsDuration < ActiveRecord::Migration[7.0]
  def change
    change_column(:sessions, :duration, 'integer USING CAST(duration AS integer)')
  end
end
