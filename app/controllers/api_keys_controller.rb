class ApiKeysController < ApplicationController
  layout 'client'

  def edit
    @user = current_user
    @api_key = ApiKey.new
  end

  def update
    
  end
end
