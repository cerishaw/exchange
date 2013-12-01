require 'spec_helper'

describe "conversion_populators/new" do
  before(:each) do
    assign(:conversion_populator, stub_model(ConversionPopulator).as_new_record)
  end

  it "renders new conversion_populator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conversion_populators_path, "post" do
    end
  end
end
