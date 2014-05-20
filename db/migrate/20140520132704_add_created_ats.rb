class AddCreatedAts < ActiveRecord::Migration
  def change
    add_column :dues,     :created_at, :datetime
    add_column :payments, :created_at, :datetime
    add_column :fees,     :created_at, :datetime
  end
end
