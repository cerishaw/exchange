require 'spec_helper'

describe "conversion_populators/show" do
  before(:each) do
    @conversion_populator = assign(:conversion_populator, stub_model(ConversionPopulator))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
