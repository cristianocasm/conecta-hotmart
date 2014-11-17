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

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def is_active?(controller, type=nil)
    "active" if params[:controller] == controller
  end
end
