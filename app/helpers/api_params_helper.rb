module ApiParamsHelper

  # Returns a dynamic path based on the provided parameters

  def script_api_url(api = "api_param", type = nil, action = nil)
    send "#{format_script(action, api, type)}_url", type
  end
  
  def script_api_path(api = "api_param", type = nil, action = nil)
    send "#{format_script(action, api, type)}_path", type
  end

  def format_script(action, api, type)
    action || type ? "#{format_action(action)}#{api.underscore}" : "#{api.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
