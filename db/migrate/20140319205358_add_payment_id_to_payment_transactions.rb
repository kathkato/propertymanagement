class AddPaymentIdToPaymentTransactions < ActiveRecord::Migration
  def change
    add_column :payment_transactions, :payment_id, :integer
  end
end
