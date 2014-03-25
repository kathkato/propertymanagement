class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :ip_address
      t.string :first_name
      t.string :last_name
      t.date :card_expires_on

      t.timestamps
    end
  end
end
