require "spec_helper"

describe ConversionPopulatorsController do
  describe "routing" do

    it "routes to #index" do
      get("/conversion_populators").should route_to("conversion_populators#index")
    end

    it "routes to #new" do
      get("/conversion_populators/new").should route_to("conversion_populators#new")
    end

    it "routes to #show" do
      get("/conversion_populators/1").should route_to("conversion_populators#show", :id => "1")
    end

    it "routes to #edit" do
      get("/conversion_populators/1/edit").should route_to("conversion_populators#edit", :id => "1")
    end

    it "routes to #create" do
      post("/conversion_populators").should route_to("conversion_populators#create")
    end

    it "routes to #update" do
      put("/conversion_populators/1").should route_to("conversion_populators#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/conversion_populators/1").should route_to("conversion_populators#destroy", :id => "1")
    end

  end
end
