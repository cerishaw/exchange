module CurrencyConversionsHelper
  def closest_weekday(day)
    if day.saturday? then
      return day - 1
    end
    return day
  end
end
