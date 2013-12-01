class ConversionPopulatorsController < ApplicationController

  # GET /conversion_populators/new
  def new
    @conversion_populator = ConversionPopulator.new
  end


  # POST /conversion_populators
  def create
    @conversion_populator = ConversionPopulator.new

    if @conversion_populator.valid?
      ConversionPopulatorsHelper.extract_xml
      render 'show'
    else
      render action: 'new'
    end
  end
end
