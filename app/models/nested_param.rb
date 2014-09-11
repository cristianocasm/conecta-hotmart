class NestedParam < ActiveRecord::Base
  belongs_to :api_param
  belongs_to :child_param, class_name: 'ApiParam'
end
