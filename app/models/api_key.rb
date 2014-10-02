class ApiKey < ActiveRecord::Base
  
  # scopes for inherited models
  scope :helpscout_api_key, -> { where(type: 'HelpscoutApiKey').limit(1) } 
  scope :hotmart_api_key, -> { where(type: 'HotmartApiKey').limit(1) } 
  scope :mailchimp_api_key, -> { where(type: 'MailchimpApiKey').limit(1) }

  belongs_to :user
end
