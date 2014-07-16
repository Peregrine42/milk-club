class ChangeMultipliersToFloats < ActiveRecord::Migration
  def change
    change_column :members, :multiplier, :float, :default => 1.0
  end
end
