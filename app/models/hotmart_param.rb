# == Schema Information
#
# Table name: api_params
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  description             :text(255)
#  type                    :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  data_type_id            :integer
#  show_in_activation_rule :boolean          default(FALSE)
#

class HotmartParam < ApiParam
  scope :allowed_in_activation_rule, -> { where(show_in_activation_rule: true) }
end
