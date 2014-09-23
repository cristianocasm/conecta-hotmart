class ApiKey < ActiveRecord::Base
  belongs_to :user
  belongs_to :api

  scope :by_user, lambda { |user| where("api_keys.user_id = #{user.id}") }
end
