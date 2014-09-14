require 'rails_helper'

RSpec.describe "HotmartParam usage of ApiParam's helpers" do
  it_behaves_like 'ApiParamsHelper', 'HotmartParam', FactoryGirl.create(:hotmart_param)
end