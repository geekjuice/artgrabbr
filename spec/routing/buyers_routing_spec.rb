require "spec_helper"

describe BuyersController do
  describe "routing" do

    it "routes to #index" do
      get("/buyers").should route_to("buyers#index")
    end

    it "routes to #new" do
      get("/buyers/new").should route_to("buyers#new")
    end

    it "routes to #show" do
      get("/buyers/1").should route_to("buyers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/buyers/1/edit").should route_to("buyers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/buyers").should route_to("buyers#create")
    end

    it "routes to #update" do
      put("/buyers/1").should route_to("buyers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/buyers/1").should route_to("buyers#destroy", :id => "1")
    end

  end
end
