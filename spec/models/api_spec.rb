require 'rails_helper'

RSpec.describe Api, :type => :model do
  it { should have_many :api_keys}
end
