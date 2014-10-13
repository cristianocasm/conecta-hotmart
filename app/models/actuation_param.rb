class ActuationParam < ActiveRecord::Base
  belongs_to :actuation_rule
  belongs_to :argument
  
  belongs_to :hotmart_param, class_name: 'ApiParam', foreign_key: "hotmart_param_id"
  scope :hotmart_param, -> { joins(:api_params).where(type: 'HotmartParam') }
end
