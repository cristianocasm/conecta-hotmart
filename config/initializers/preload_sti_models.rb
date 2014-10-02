=begin
  Child classes are not recognized by the parent until they are loaded.
  In typical Rails production and test environments this happens right
  away, but in development, where config.cache_classes == false,
  classes aren’t loaded until you call upon them. So, for this to work
  consistently in our development environment we need to manually
  require classes.
=end

if Rails.env.development?
  %w[api_param mailchimp_param hotmart_param helpscout_param api_key mailchimp_api_key hotmart_api_key helpscout_api_key].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end