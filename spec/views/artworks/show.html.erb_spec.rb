require 'spec_helper'

describe "artworks/show" do
  before(:each) do
    @artwork = assign(:artwork, stub_model(Artwork,
      :user => nil,
      :title => "Title",
      :price => "9.99",
      :medium => "Medium"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Title/)
    rendered.should match(/9.99/)
    rendered.should match(/Medium/)
  end
end
