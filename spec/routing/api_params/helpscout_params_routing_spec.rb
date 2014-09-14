require 'rails_helper'

RSpec.describe "HelpscoutParam's routes" do
  it_behaves_like 'ApiParamsRoute', 'HelpscoutParam', FactoryGirl.create(:helpscout_param)
end