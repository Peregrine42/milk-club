class CreateDues < ActiveRecord::Migration
  def change
    create_table :dues do |t|
      t.integer :member_id
      t.decimal :amount
    end
  end
end
