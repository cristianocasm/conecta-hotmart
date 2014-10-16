# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  validated  :boolean
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#

class ApiKey < ActiveRecord::Base
  
  # scopes for inherited models
  scope :helpscout_api_key, -> { where(type: 'HelpscoutApiKey') } 
  scope :hotmart_api_key, -> { where(type: 'HotmartApiKey') } 
  scope :mailchimp_api_key, -> { where(type: 'MailchimpApiKey') }

  belongs_to :user
end
