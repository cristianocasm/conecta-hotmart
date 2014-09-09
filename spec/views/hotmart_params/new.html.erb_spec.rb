require 'rails_helper'

RSpec.describe "hotmart_params/new", :type => :view do
  before(:each) do
    assign(:hotmart_param, HotmartParam.new(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new hotmart_param form" do
    render

    assert_select "form[action=?][method=?]", hotmart_params_path, "post" do

      assert_select "input#hotmart_param_name[name=?]", "hotmart_param[name]"

      assert_select "textarea#hotmart_param_description[name=?]", "hotmart_param[description]"
    end
  end
end
