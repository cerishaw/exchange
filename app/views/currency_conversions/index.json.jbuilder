json.array!(@currency_conversions) do |currency_conversion|
  json.extract! currency_conversion, :from_code, :to_code, :amount, :date, :new, :create
  json.url currency_conversion_url(currency_conversion, format: :json)
end