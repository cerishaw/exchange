class CurrencyConversionsController < ApplicationController
  include CurrencyConversionsHelper

  # GET /currency_conversions/new
  def new
    @currency_conversion = CurrencyConversion.new
    @currencies = get_all_currencies()
    @min_date = get_min_date()
    @max_date = get_max_date()
  end

  # POST /currency_conversions
  def create
    @currency_conversion = CurrencyConversion.new(currency_conversion_params)
    @currencies = get_all_currencies()
    @min_date = get_min_date()
    @max_date = get_max_date()

    if @currency_conversion.valid?
      actual_exchange_date = closest_weekday(@currency_conversion.date)
      rate = ExchangeRate.at(actual_exchange_date, @currency_conversion.from_code, @currency_conversion.to_code)
      @converted_amount = format_as_money(rate * @currency_conversion.amount)
      render 'show'
    else
      render action: 'new'
    end

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Sorry no currency exchange information exists for that day"
    redirect_to :action => 'new'
  end


  private
   # Never trust parameters from the scary internet, only allow the white list through.
  def currency_conversion_params
    params.require(:currency_conversion).permit(:from_code, :to_code, :amount, :date)
  end

  def format_as_money(money_amount)
    money_amount.round(2)
  end

  def get_max_date
    ConversionRate.order(:date).last.date
  end

  def get_min_date
    ConversionRate.order(:date).first.date
  end

  def get_all_currencies
    Currency.all.order(:code)
  end
end
