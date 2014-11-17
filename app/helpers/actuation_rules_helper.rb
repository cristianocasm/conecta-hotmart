module ActuationRulesHelper
  def create_options_for_actuation_rules(api_param)
    options = {}

    if !api_param.accepted_values.blank?
      if api_param.accepted_values.first.placeholder.blank?
        options.merge!(collection: api_param.accepted_values.map(&:value))
      else
        options.merge!(collection: api_param.accepted_values.map{ |av| [av.placeholder, av.value]})
      end
    elsif api_param.data_type.name == 'boolean'
      options.merge!(as: :radio_buttons)
    elsif api_param.name == 'group_name'
      options.merge!(readonly: true)
    end
    
    return options
  end
end
