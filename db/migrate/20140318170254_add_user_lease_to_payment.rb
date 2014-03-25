class AddUserLeaseToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :user_id, :integer
    add_column :payments, :lease_id, :integer
  end
end
