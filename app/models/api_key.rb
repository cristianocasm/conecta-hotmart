class ApiKey < ActiveRecord::Base
  belongs_to :user
  belongs_to :api
end
