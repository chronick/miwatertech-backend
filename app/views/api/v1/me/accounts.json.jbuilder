json.array! @accounts do |account|
  json.(account, :id, :account_number)
  json.authority account.authority, :id, :name
end