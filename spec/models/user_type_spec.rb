require 'rails_helper'

RSpec.describe UserType, :type => :model do
  it { should have_many :users }
end
