jQuery ->
  $('form').on 'change', '#mailchimp_actuation_rule_actuation_params_attributes_0_value', (event) ->
    if($("#mailchimp_actuation_rule_actuation_params_attributes_0_value").val())
      $("#mailchimp_actuation_rule_actuation_params_attributes_1_value").removeAttr('readonly')
    else
      $("#mailchimp_actuation_rule_actuation_params_attributes_1_value").val('')
      $("#mailchimp_actuation_rule_actuation_params_attributes_1_value").prop('readonly', true)