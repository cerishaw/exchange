class CurrencyConversionsController < ApplicationController

  # GET /currency_conversions/new
  def new
    @currency_conversion = CurrencyConversion.new
    @currencies = Currency.all
    @min_date = get_min_date()
    @max_date = get_max_date()
  end

  # POST /currency_conversions
  def create
    @currency_conversion = CurrencyConversion.new(currency_conversion_params)
    @currencies = Currency.all
    @min_date = get_min_date()
    @max_date = get_max_date()

    if @currency_conversion.valid?
      rate = ExchangeRate.at(@currency_conversion.date, @currency_conversion.from_code, @currency_conversion.to_code)
      @converted_amount = format_as_money(rate * @currency_conversion.amount)
      render 'show'
    else
      render action: 'new'
    end
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
end
