class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :account_id
      t.integer :usage
      t.datetime :read_at
      t.string :read_type

      t.timestamps
    end
  end
end
