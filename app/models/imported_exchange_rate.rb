class ImportedExchangeRate
  attr_accessor :date, :rate, :currency_code

  def initialize(date, currency_code, rate)
    self.date = date
    self.currency_code = currency_code
    self.rate = rate
  end

end
