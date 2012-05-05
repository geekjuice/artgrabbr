require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "Email",
      :first_name => "First Name",
      :last_name => "Last Name",
      :school => "School",
      :major => "Major",
      :bio => "Bio"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/School/)
    rendered.should match(/Major/)
    rendered.should match(/Bio/)
  end
end
