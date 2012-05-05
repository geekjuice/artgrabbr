require 'spec_helper'

describe "artworks/index" do
  before(:each) do
    assign(:artworks, [
      stub_model(Artwork,
        :user => nil,
        :title => "Title",
        :price => "9.99",
        :medium => "Medium"
      ),
      stub_model(Artwork,
        :user => nil,
        :title => "Title",
        :price => "9.99",
        :medium => "Medium"
      )
    ])
  end

  it "renders a list of artworks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Medium".to_s, :count => 2
  end
end
