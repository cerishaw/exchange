class ExchangeRateDataSource
  CORE_CURRENCY = "EUR"

  def initialize
    url = 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'

    doc = Nokogiri::XML(open(url))
    doc.remove_namespaces!

    @all_exchange_rates = []
    days = doc.search('/Envelope/Cube/Cube')

    days.each do |day_node|
      @all_exchange_rates.push(*get_rates_for_day(day_node))
    end
  end

  def all
    @all_exchange_rates
  end

  def find(date)
    @all_exchange_rates.find_all {|rate| rate.date == date}
  end

  private
  def get_rates_for_day(date_node)
    all_rates_for_day = []

    date = get_date(date_node)
    all_rates_for_day.push(create_core_rate(date))
    rates = date_node.children
    rates.each do |rate_node|
      all_rates_for_day.push(create_exchange_rate_from_node(date, rate_node))
    end
    all_rates_for_day
  end

  def create_core_rate(date)
    return create_exchange_rate(date, CORE_CURRENCY, 1)
  end

  def create_exchange_rate_from_node(date, node)
    currency_code = get_currency_code(node)
    rate = get_rate(node)
    return create_exchange_rate(date, currency_code, rate)
  end

  def create_exchange_rate(date, currency_code, rate)
    return ImportedExchangeRate.new(date, currency_code, rate)
  end

  def get_date(node)
    Date.parse(node.attribute('time'))
  end

  def get_currency_code(node)
    node.attribute('currency').value
  end

  def get_rate(node)
    node.attribute('rate').value.to_f
  end
end