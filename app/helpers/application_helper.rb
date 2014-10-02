module ApplicationHelper
  def script_api_path(api, type = nil, action = nil)
    send "#{format_script(action, api, type)}_path", type
  end

  def format_script(action, api, type)
    action || type ? "#{format_action(action)}#{api.underscore}" : "#{api.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
