require "spec_helper"

describe CurrencyConversionsController do
  describe "routing" do

    it "routes to #index" do
      get("/currency_conversions").should route_to("currency_conversions#index")
    end

    it "routes to #new" do
      get("/currency_conversions/new").should route_to("currency_conversions#new")
    end

    it "routes to #show" do
      get("/currency_conversions/1").should route_to("currency_conversions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/currency_conversions/1/edit").should route_to("currency_conversions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/currency_conversions").should route_to("currency_conversions#create")
    end

    it "routes to #update" do
      put("/currency_conversions/1").should route_to("currency_conversions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/currency_conversions/1").should route_to("currency_conversions#destroy", :id => "1")
    end

  end
end
