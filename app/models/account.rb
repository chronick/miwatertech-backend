class Account < ActiveRecord::Base
  belongs_to :authority
  has_many :readings
  has_and_belongs_to_many :users
end
