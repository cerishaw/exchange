require 'spec_helper'

describe "currency_conversions/edit" do
  before(:each) do
    @currency_conversion = assign(:currency_conversion, stub_model(CurrencyConversion,
      :from_code => "",
      :to_code => "",
      :amount => 1,
      :new => "MyString",
      :create => "MyString"
    ))
  end

  it "renders the edit currency_conversion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", currency_conversion_path(@currency_conversion), "post" do
      assert_select "input#currency_conversion_from_code[name=?]", "currency_conversion[from_code]"
      assert_select "input#currency_conversion_to_code[name=?]", "currency_conversion[to_code]"
      assert_select "input#currency_conversion_amount[name=?]", "currency_conversion[amount]"
      assert_select "input#currency_conversion_new[name=?]", "currency_conversion[new]"
      assert_select "input#currency_conversion_create[name=?]", "currency_conversion[create]"
    end
  end
end
