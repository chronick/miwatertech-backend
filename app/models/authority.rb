class Authority < ActiveRecord::Base
  has_many :accounts
end
