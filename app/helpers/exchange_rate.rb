module ExchangeRate
  def self.at(date, base_currency_code, counter_currency_code)

    base_rate = find_conversion_rate_on_date(date, base_currency_code)
    counter_rate = find_conversion_rate_on_date(date, counter_currency_code)

    counter_rate / base_rate
  end

  private

  def self.find_conversion_rate_on_date(date, currency_code)
    ConversionRate.joins('INNER JOIN currencies ON currencies.id = conversion_rates.currency_id')
                    .where(currencies: {code: currency_code}, date: date)
                    .first!.rate
  end
end