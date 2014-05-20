class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.decimal :amount
      t.datetime :created_at
    end
  end
end
