require 'rails_helper'

RSpec.describe "hotmart_params/index", :type => :view do
  before(:each) do
    assign(:hotmart_params, [
      HotmartParam.create!(
        :name => "param1",
        :description => "description"
      ),
      HotmartParam.create!(
        :name => "param2",
        :description => "description"
      )
    ])
  end

  it "renders a list of hotmart_params" do
    render
    assert_select "tr>td", text: "param1", :count => 1
    assert_select "tr>td", text: "param2", :count => 1
    assert_select "tr>td", text: "description", :count => 2
  end

  it "renders a search box" do
    render
    
  end
end
