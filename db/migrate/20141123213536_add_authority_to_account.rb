class AddAuthorityToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :authority_id, :integer
  end
end
