require "spec_helper"

describe ArtworksController do
  describe "routing" do

    it "routes to #index" do
      get("/artworks").should route_to("artworks#index")
    end

    it "routes to #new" do
      get("/artworks/new").should route_to("artworks#new")
    end

    it "routes to #show" do
      get("/artworks/1").should route_to("artworks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/artworks/1/edit").should route_to("artworks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/artworks").should route_to("artworks#create")
    end

    it "routes to #update" do
      put("/artworks/1").should route_to("artworks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/artworks/1").should route_to("artworks#destroy", :id => "1")
    end

  end
end
