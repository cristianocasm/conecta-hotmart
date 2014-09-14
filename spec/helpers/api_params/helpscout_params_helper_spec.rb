require 'rails_helper'

RSpec.describe "HelpscoutParam usage of ApiParam's helpers" do
  it_behaves_like 'ApiParamsHelper', 'HelpscoutParam', FactoryGirl.create(:helpscout_param)
end