json.array!(@hotmart_params) do |hotmart_param|
  json.extract! hotmart_param, :id, :name, :description
  json.url hotmart_param_url(hotmart_param, format: :json)
end
