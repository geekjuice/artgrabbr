require 'spec_helper'

describe "artworks/new" do
  before(:each) do
    assign(:artwork, stub_model(Artwork,
      :user => nil,
      :title => "MyString",
      :price => "9.99",
      :medium => "MyString"
    ).as_new_record)
  end

  it "renders new artwork form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artworks_path, :method => "post" do
      assert_select "input#artwork_user", :name => "artwork[user]"
      assert_select "input#artwork_title", :name => "artwork[title]"
      assert_select "input#artwork_price", :name => "artwork[price]"
      assert_select "input#artwork_medium", :name => "artwork[medium]"
    end
  end
end
