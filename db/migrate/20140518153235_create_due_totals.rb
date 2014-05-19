class CreateDueTotals < ActiveRecord::Migration
  def change
    create_table :due_totals do |t|
      t.decimal :amount
    end
  end
end
