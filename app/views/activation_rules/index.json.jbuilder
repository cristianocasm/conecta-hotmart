json.array!(@activation_rules) do |rule|
  json.extract! rule, :id, :name, :description
  json.url rule_url(rule, format: :json)
end
