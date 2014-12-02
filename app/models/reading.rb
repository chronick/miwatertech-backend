class Reading < ActiveRecord::Base
  belongs_to :account
  before_save :create_account

  attr_accessor :account_number
  validates :account_number, presence: true

  public

  def self.import(readings)
    saved_readings = Reading.create(readings)
    saved_readings
  end

  def create_account
    account = Account.find_by_account_number(self.account_number)

    if account.nil?
      authority = Authority.first
      account = Account.create(account_number: self.account_number, authority: authority, is_amr: true)
    end

    self.account_id = account.id
  end
end
