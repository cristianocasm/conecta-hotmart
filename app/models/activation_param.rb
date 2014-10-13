class ActivationParam < ActiveRecord::Base
  belongs_to :activation_rule
  belongs_to :api_param
end
