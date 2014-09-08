require 'rails_helper'

RSpec.describe "hotmart_params/edit", :type => :view do
  before(:each) do
    @hotmart_param = assign(:hotmart_param, HotmartParam.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit hotmart_param form" do
    render

    assert_select "form[action=?][method=?]", hotmart_param_path(@hotmart_param), "post" do

      assert_select "input#hotmart_param_name[name=?]", "hotmart_param[name]"

      assert_select "input#hotmart_param_description[name=?]", "hotmart_param[description]"
    end
  end
end
