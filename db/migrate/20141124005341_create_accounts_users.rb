class CreateAccountsUsers < ActiveRecord::Migration
  def change
    create_table :accounts_users, id: false do |t|
      t.integer :user_id
      t.integer :account_id
    end
  end
end
