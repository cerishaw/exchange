require 'spec_helper'

describe "conversion_populators/index" do
  before(:each) do
    assign(:conversion_populators, [
      stub_model(ConversionPopulator),
      stub_model(ConversionPopulator)
    ])
  end

  it "renders a list of conversion_populators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
