# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Authority.destroy_all
Account.destroy_all
Reading.destroy_all
AdminUser.destroy_all
User.destroy_all

AdminUser.create(email: 'nick@myfab5.com', password: 'admin1234', password_confirmation: 'admin1234')

dwsd = Authority.create(name: 'Detroit Water and Sewage Department')

10.times do
  user = User.create(email: 'testuser@mailinator.com', password: 'test1234')
  account = Account.create(users: [user], authority: dwsd, account_number: 'hello', is_amr: true)

  10.times do |i|
    Reading.create(account: account, usage: i, read_at: Time.now, read_type: 'Actual Reading')
  end
end
