require 'spec_helper'

describe "currency_conversions/index" do
  before(:each) do
    assign(:currency_conversions, [
      stub_model(CurrencyConversion,
        :from_code => "",
        :to_code => "",
        :amount => 1,
        :new => "New",
        :create => "Create"
      ),
      stub_model(CurrencyConversion,
        :from_code => "",
        :to_code => "",
        :amount => 1,
        :new => "New",
        :create => "Create"
      )
    ])
  end

  it "renders a list of currency_conversions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
  end
end
