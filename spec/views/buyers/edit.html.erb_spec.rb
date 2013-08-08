require 'spec_helper'

describe "buyers/edit" do
  before(:each) do
    @buyer = assign(:buyer, stub_model(Buyer,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :inquirycount => 1
    ))
  end

  it "renders the edit buyer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buyers_path(@buyer), :method => "post" do
      assert_select "input#buyer_first_name", :name => "buyer[first_name]"
      assert_select "input#buyer_last_name", :name => "buyer[last_name]"
      assert_select "input#buyer_email", :name => "buyer[email]"
      assert_select "input#buyer_inquirycount", :name => "buyer[inquirycount]"
    end
  end
end
