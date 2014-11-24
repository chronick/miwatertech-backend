class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.string :account_number
      t.boolean :is_amr
      t.timestamps
    end
  end

  def down
    drop_table :accounts
  end
end
