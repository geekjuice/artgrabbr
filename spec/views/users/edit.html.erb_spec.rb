require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :school => "MyString",
      :major => "MyString",
      :bio => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_first_name", :name => "user[first_name]"
      assert_select "input#user_last_name", :name => "user[last_name]"
      assert_select "input#user_school", :name => "user[school]"
      assert_select "input#user_major", :name => "user[major]"
      assert_select "input#user_bio", :name => "user[bio]"
    end
  end
end
