require 'rspec'
require 'date'
require_relative '../../app/helpers/currency_conversions_helper'

include CurrencyConversionsHelper

describe 'closest weekday' do
  it 'should be same day when day is a weekday' do
    day = Date.new(2013,12,17)
    closest_weekday(day).should eql day
  end

  it 'should return previous friday when day is a saturday' do
    selected_day = Date.new(2013,12,14)
    previous_friday = Date.new(2013,12,13)
    closest_weekday(selected_day).should eql previous_friday
  end

  it 'should return previous friday when day is a sunday' do
    selected_day = Date.new(2013,12,15)
    previous_friday = Date.new(2013,12,13)
    closest_weekday(selected_day).should eql previous_friday
  end
end