require 'nokogiri'
require 'open-uri'

module ConversionPopulatorsHelper
  def self.extract_xml
    data_source = ExchangeRateDataSource.new
    data_source.all.each do |exchange_rate|
      currency = find_or_create_currency(exchange_rate.currency_code)
      find_or_create_rate(exchange_rate.date, currency.id, exchange_rate.rate)
    end
  end

  private
  def self.find_or_create_currency(currency_code)
    Currency.where(code: currency_code).first_or_create
  end

  def self.find_or_create_rate(date, currency_id, rate)
    ConversionRate.where(date: date, currency_id: currency_id, rate: rate)
                  .first_or_create
  end
end
