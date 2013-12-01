require 'nokogiri'
require 'open-uri'

module ConversionPopulatorsHelper
  def self.extract_xml
    url = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'

    doc = Nokogiri::XML(open(url))
    doc.remove_namespaces!

    daily_rate_sets = doc.search('/Envelope/Cube/Cube')

    daily_rate_sets.each do |daily_rate_set|
      date = Date.parse(daily_rate_set.attribute('time'))
      daily_rates = daily_rate_set.children
      daily_rates.each do |rate|
        currency_code = rate.attribute('currency').value
        rate = rate.attribute('rate').value.to_f
        currency = find_or_create_currency(currency_code)
        find_or_create_rate(date,currency.id,rate)
      end
    end
    14
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
