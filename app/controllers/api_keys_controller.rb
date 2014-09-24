class ApiKeysController < ApplicationController
  layout 'client'

  def edit
    @user ||= current_user
    @api = params[:api] || 'hotmart'
    @api_key = @user.api_key(@api) || ApiKey.new
  end

  def update
    @user ||= current_user
    @api_key = @user.api_key(api_key_params[:api]) || ApiKey.new
    respond_to do |format|
      if @api_key.update()
        format.html { redirect_to @api_param, notice: 'Param was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_param }
      else
        format.html { render :edit }
        format.json { render json: @api_param.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def api_key_params
    params.require(:api_key).permit(:key, :api)
  end
end
