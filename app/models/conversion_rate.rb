class ConversionRates < ActiveRecord::Base
  has_one :currency

  validates :date, presence:true
  validates :rate, presence:true
  validates :currency_id, presence:true
end
