require 'rspec'
require 'date'
require_relative '../../app/helpers/currency_conversions_helper'

include CurrencyConversionsHelper

describe 'closest weekday' do
  it 'should be same day when day is a weekday' do
    day = Date.new(2013,12,17)
    closest_weekday(day).should.equal?(day)
  end
end