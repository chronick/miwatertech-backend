ActiveAdmin.register Account do

  permit_params :account_number
  filter :account_number
  filter :is_amr

  index do
    id_column
    column :account_number
    column :is_amr
    column :authority
    column :created_at
    column :updated_at
    actions
  end
end
