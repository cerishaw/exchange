require 'spec_helper'

describe "currency_conversions/show" do
  before(:each) do
    @currency_conversion = assign(:currency_conversion, stub_model(CurrencyConversion,
      :from_code => "",
      :to_code => "",
      :amount => 1,
      :new => "New",
      :create => "Create"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/New/)
    rendered.should match(/Create/)
  end
end
