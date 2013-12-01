require 'spec_helper'

describe "ConversionPopulators" do
  describe "GET /conversion_populators" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get conversion_populators_path
      response.status.should be(200)
    end
  end
end
