json.(@user,
    :id,
    :email,
    :created_at,
    :updated_at)

json.accounts @user.accounts do |account|
  json.(account, :id, :account_number)
  json.authority account.authority, :id, :name
end

