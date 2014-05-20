class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.decimal :amount
    end
  end
end
