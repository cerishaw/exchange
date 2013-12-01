class CurrencyConversion < ActiveRecord::Base
  validates :date, presence:true
  validates :amount, presence:true
  validates :from_code, presence:true, length: { is: 3 }
  validates :to_code, presence:true, length: { is: 3 }
end
