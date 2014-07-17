class AddMultiplierToMembers < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.decimal :multiplier, precision: 4, scale: 2, default: 1
    end
  end
end
