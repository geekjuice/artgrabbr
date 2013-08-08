require 'spec_helper'

describe "buyers/new" do
  before(:each) do
    assign(:buyer, stub_model(Buyer,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :inquirycount => 1
    ).as_new_record)
  end

  it "renders new buyer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buyers_path, :method => "post" do
      assert_select "input#buyer_first_name", :name => "buyer[first_name]"
      assert_select "input#buyer_last_name", :name => "buyer[last_name]"
      assert_select "input#buyer_email", :name => "buyer[email]"
      assert_select "input#buyer_inquirycount", :name => "buyer[inquirycount]"
    end
  end
end
