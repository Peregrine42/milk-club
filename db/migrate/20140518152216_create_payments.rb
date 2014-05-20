class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :member_id
      t.decimal :amount
      t.datetime :created_at
    end
  end
end
