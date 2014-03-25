class AddLeaseIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :lease_id, :integer
  end
end
