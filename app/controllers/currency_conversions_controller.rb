class CurrencyConversionsController < ApplicationController

  # GET /currency_conversions/new
  def new
    @currency_conversion = CurrencyConversion.new
  end

  # POST /currency_conversions
  def create
    @currency_conversion = CurrencyConversion.new(currency_conversion_params)

    respond_to do |format|
      if @currency_conversion.valid?
        render 'show'
      else
        format.html { render action: 'new' }
      end
    end
  end


  private
     # Never trust parameters from the scary internet, only allow the white list through.
    def currency_conversion_params
      params.require(:currency_conversion).permit(:from_code, :to_code, :amount, :date, :new, :create)
    end
end
