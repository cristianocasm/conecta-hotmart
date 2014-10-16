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

class HelpscoutApiKey < ApiKey
end
