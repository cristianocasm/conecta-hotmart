require 'rails_helper'

RSpec.describe "HotmartParam's routes" do
  it_behaves_like 'ApiParamsRoute', 'HotmartParam', FactoryGirl.create(:hotmart_param)
end