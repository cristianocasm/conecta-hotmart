module ActivationRulesHelper
  
  def create_options(activation_param)
    options = {}

    if !activation_param.api_param.accepted_values.blank?
      options.merge!(collection: activation_param.api_param.accepted_values.map(&:value))
    elsif activation_param.api_param.data_type.name == 'boolean'
      options.merge!(as: :radio_buttons)
    elsif activation_param.api_param.data_type.name == 'date'
      options.merge!(as: :date, html5: true)
      options.merge!(value: localize(activation_param.value.to_date)) unless activation_param.value.blank?
    elsif activation_param.api_param.name == 'group_name'
      options.merge!(readonly: true)
    end
    
    return options
  end

end
