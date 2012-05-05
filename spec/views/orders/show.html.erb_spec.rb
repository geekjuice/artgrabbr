require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :name => "Name",
      :email => "Email",
      :address_line_1 => "Address Line 1",
      :address_line_2 => "Address Line 2",
      :city => "City",
      :state => "State",
      :zipcode => "Zipcode",
      :subtotal => "9.99",
      :total => "9.99",
      :delivary_method => "Delivary Method"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Address Line 1/)
    rendered.should match(/Address Line 2/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zipcode/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/Delivary Method/)
  end
end
