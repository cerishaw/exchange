require 'spec_helper'

describe "CurrencyConversions" do
  describe "GET /currency_conversions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get currency_conversions_path
      response.status.should be(200)
    end
  end
end
