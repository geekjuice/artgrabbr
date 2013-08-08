require 'spec_helper'

describe "buyers/show" do
  before(:each) do
    @buyer = assign(:buyer, stub_model(Buyer,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :inquirycount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
  end
end
