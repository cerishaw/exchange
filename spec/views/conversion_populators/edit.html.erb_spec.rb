require 'spec_helper'

describe "conversion_populators/edit" do
  before(:each) do
    @conversion_populator = assign(:conversion_populator, stub_model(ConversionPopulator))
  end

  it "renders the edit conversion_populator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conversion_populator_path(@conversion_populator), "post" do
    end
  end
end
