require 'rails_helper'

RSpec.describe "hotmart_params/show", :type => :view do
  before(:each) do
    @hotmart_param = assign(:hotmart_param, HotmartParam.create!(
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
  end
end
