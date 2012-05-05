require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :email => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :school => "MyString",
      :major => "MyString",
      :bio => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_first_name", :name => "user[first_name]"
      assert_select "input#user_last_name", :name => "user[last_name]"
      assert_select "input#user_school", :name => "user[school]"
      assert_select "input#user_major", :name => "user[major]"
      assert_select "input#user_bio", :name => "user[bio]"
    end
  end
end
