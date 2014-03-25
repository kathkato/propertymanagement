class AddPropertyIdToUnit < ActiveRecord::Migration
  def change
    add_column :units, :property_id, :integer
  end
end
