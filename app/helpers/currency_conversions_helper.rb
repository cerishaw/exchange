module CurrencyConversionsHelper
  def closest_weekday(day)
    if day.saturday? then
      return day - 1
    elsif day.sunday? then
      return day - 2
    end
    return day
  end
end
