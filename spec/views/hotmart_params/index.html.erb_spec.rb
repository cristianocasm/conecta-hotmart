require 'rails_helper'

RSpec.describe "hotmart_params/index", :type => :view do
  before(:each) do
    assign(:hotmart_params, [
      HotmartParam.create!(
        :name => "Name",
        :description => "Description"
      ),
      HotmartParam.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of hotmart_params" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
