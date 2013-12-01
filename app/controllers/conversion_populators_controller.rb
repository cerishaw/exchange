class ConversionPopulatorsController < ApplicationController

  # GET /conversion_populators/new
  def new
    @conversion_populator = ConversionPopulator.new(date: Date.today)
  end


  # POST /conversion_populators
  def create
    @conversion_populator = ConversionPopulator.new(conversion_populator_params)

    if @conversion_populator.valid?
      @entries_added = ConversionPopulatorsHelper.extract_xml
      render 'show'
    else
      render action: 'new'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def conversion_populator_params
      params.require(:conversion_populator).permit(:date)
    end
end
