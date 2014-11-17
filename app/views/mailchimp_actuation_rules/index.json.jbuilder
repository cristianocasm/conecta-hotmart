json.array!(@actuation_rules) do |actuation_rule|
  json.extract! actuation_rule, :id, :name, :description
  json.url actuation_rule_url(actuation_rule, format: :json)
end
