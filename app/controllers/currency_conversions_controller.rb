class CurrencyConversionsController < ApplicationController
  before_action :set_currency_conversion, only: [:show, :edit, :update, :destroy]

  # GET /currency_conversions
  # GET /currency_conversions.json
  def index
    @currency_conversions = CurrencyConversion.all
  end

  # GET /currency_conversions/1
  # GET /currency_conversions/1.json
  def show
  end

  # GET /currency_conversions/new
  def new
    @currency_conversion = CurrencyConversion.new
  end

  # GET /currency_conversions/1/edit
  def edit
  end

  # POST /currency_conversions
  # POST /currency_conversions.json
  def create
    @currency_conversion = CurrencyConversion.new(currency_conversion_params)

    respond_to do |format|
      if @currency_conversion.save
        format.html { redirect_to @currency_conversion, notice: 'Currency conversion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @currency_conversion }
      else
        format.html { render action: 'new' }
        format.json { render json: @currency_conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currency_conversions/1
  # PATCH/PUT /currency_conversions/1.json
  def update
    respond_to do |format|
      if @currency_conversion.update(currency_conversion_params)
        format.html { redirect_to @currency_conversion, notice: 'Currency conversion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @currency_conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currency_conversions/1
  # DELETE /currency_conversions/1.json
  def destroy
    @currency_conversion.destroy
    respond_to do |format|
      format.html { redirect_to currency_conversions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_conversion
      @currency_conversion = CurrencyConversion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_conversion_params
      params.require(:currency_conversion).permit(:from_code, :to_code, :amount, :date, :new, :create)
    end
end
