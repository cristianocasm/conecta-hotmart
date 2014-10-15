module ActivationRulesHelper
  
  def create_options(api_param)
    options = {}

    if !api_param.accepted_values.blank?
      options.merge!(collection: api_param.accepted_values.map(&:value))
    elsif api_param.data_type.name == 'boolean'
      options.merge!(as: :radio_buttons)
    end
    
    return options
  end

end
