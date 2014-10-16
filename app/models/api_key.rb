class ApiKey < ActiveRecord::Base
  
  # scopes for inherited models
  scope :helpscout_api_key, -> { where(type: 'HelpscoutApiKey') } 
  scope :hotmart_api_key, -> { where(type: 'HotmartApiKey') } 
  scope :mailchimp_api_key, -> { where(type: 'MailchimpApiKey') }

  belongs_to :user
end
