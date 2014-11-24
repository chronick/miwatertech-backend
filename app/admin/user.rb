ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation

  filter :email
  filter :accounts

  index do
    id_column
    column :email
    column :created_at
    column :sign_in_count
    column :last_sign_in_at
    actions
  end
end
