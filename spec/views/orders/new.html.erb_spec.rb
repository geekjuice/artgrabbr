require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :name => "MyString",
      :email => "MyString",
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :subtotal => "9.99",
      :total => "9.99",
      :delivary_method => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_name", :name => "order[name]"
      assert_select "input#order_email", :name => "order[email]"
      assert_select "input#order_address_line_1", :name => "order[address_line_1]"
      assert_select "input#order_address_line_2", :name => "order[address_line_2]"
      assert_select "input#order_city", :name => "order[city]"
      assert_select "input#order_state", :name => "order[state]"
      assert_select "input#order_zipcode", :name => "order[zipcode]"
      assert_select "input#order_subtotal", :name => "order[subtotal]"
      assert_select "input#order_total", :name => "order[total]"
      assert_select "input#order_delivary_method", :name => "order[delivary_method]"
    end
  end
end
