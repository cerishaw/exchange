require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'sqlite3'
require '../../app/models/currency'

url = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'

doc = Nokogiri::XML(open(url))
doc.remove_namespaces!

daily_rate_sets = doc.search('/Envelope/Cube/Cube')

#puts daily_rate_sets.first.attribute('time')

daily_rate_sets.each do |daily_rate_set|
  date = Date.parse(daily_rate_set.attribute('time'))
  daily_rates = daily_rate_set.children
  daily_rates.each do |rate|
    currency_code = rate.attribute('currency')
    rate = rate.attribute('rate').value.to_f
    currency_id = Currency.find_by_code(currency_code).id
    conversion_rate = ConversionRate.create(:date => date,:currency_id => currency_id, :rate => rate)
    puts conversion_rate
  end
end

#puts daily_rates.length