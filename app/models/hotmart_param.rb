class HotmartParam < ApiParam
  scope :allowed_in_activation_rule, -> { where(show_in_activation_rule: true) }
end