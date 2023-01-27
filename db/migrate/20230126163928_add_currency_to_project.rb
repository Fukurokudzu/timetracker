class AddCurrencyToProject < ActiveRecord::Migration[7.0]
  def change
    add_monetize :projects, :salary_per_hour, amount: { null: true, default: nil }, currency: { null: true, default: nil }
  end
end
