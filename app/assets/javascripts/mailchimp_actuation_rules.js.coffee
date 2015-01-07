jQuery ->
  $('#mailchimp_actuation_rule_actuation_params_attributes_0_value').change ->   # Se lista for alterada...
    do delete_choosen_groups
    if($("#mailchimp_actuation_rule_actuation_params_attributes_0_value").val()) # ... para alguma das escolhas possíveis
      do set_placeholder # Defina campo placeholder como sendo nome da lista escolhida
      do send_request    # Envia request para Mailchimp para carregar lista de grupos disponíveis para a lista em questão
    else # Caso lista seja alterada para para escolha vazia
      do clear_placeholder # Limpa o valor setado para placeholder
      # do clear_val         #
      # do read_only_true
      do clear_div
      do hide_link

  $('form').on 'click', '#add_group_name', (event) ->
    rand = Math.floor(Math.random() * 1000000) + 20
    window.rands ||= [] 
    window.rands.push rand
    id = $("#mailchimp_actuation_rule_actuation_params_attributes_1_argument_id").attr('value')
    create_input_hidden("
      <input class='hidden' id='mailchimp_actuation_rule_actuation_params_attributes_#{rand}_argument_id' name='mailchimp_actuation_rule[actuation_params_attributes][#{rand}][argument_id]' type='hidden' value='#{id}'>
      ")
    create_select_one("
      <select class='select optional' id='mailchimp_actuation_rule_actuation_params_attributes_#{rand}_value' name='mailchimp_actuation_rule[actuation_params_attributes][#{rand}][value]'>
        <option value=''></option>
        #{window.group_names}
        </select>
      ")
    event.preventDefault()

send_request = () ->
  request = $.get '/mailchimp_actuation_rules/load_group_names', { list_id: $("#mailchimp_actuation_rule_actuation_params_attributes_0_value").val() }
  request.success (data) ->
    do clear_div
    do show_link
    window.group_names = get_group_names(data) # Criando variável gloabal ao associá-la à variável "window"
    create_select_one "
      <select class='select optional' id='mailchimp_actuation_rule_actuation_params_attributes_1_value' name='mailchimp_actuation_rule[actuation_params_attributes][1][value]'>
        <option value=''></option>
        #{window.group_names}
        </select>
      "
  request.error (jqXHR, textStatus, errorThrown) ->
    do clear_div
    do hide_link
    create_select_one "Não há grupos para a lista selecionada."

set_placeholder = () ->
  $("#mailchimp_actuation_rule_actuation_params_attributes_0_placeholder").val($("#mailchimp_actuation_rule_actuation_params_attributes_0_value").find(":selected").text())

clear_placeholder = () ->
  $("#mailchimp_actuation_rule_actuation_params_attributes_0_placeholder").val('')

clear_div = () ->
  $("#div_input_group_name").empty()

# clear_val = () ->
#  $("#mailchimp_actuation_rule_actuation_params_attributes_1_value").val('')

# read_only_true = () ->
#  $("#mailchimp_actuation_rule_actuation_params_attributes_1_value").prop('readonly', true)

show_link = () ->
  $("#add_group_name").show()

hide_link = () ->
  $("#add_group_name").hide()

get_group_names = (data) ->
  for i in [0...data.length]
    "<option value=#{data[i]['id']}>#{data[i]['content']}</option>"

create_select_one = (content) ->
  $("#div_input_group_name").append(content)

create_input_hidden = (content) ->
  $("#div_argument_id").append(content)

delete_choosen_groups = () ->
  