class ApiKeysController < ApplicationController
  layout 'client'

  before_action :set_api_name
  before_action :set_api_key_obj, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @api_key.update(api_key_params)
        format.html { redirect_to script_api_path(@api_name, @api_key, :edit), notice: I18n.t('api.key_updated', api_name: @api_name) }
        format.json { render :show, status: :ok, location: @api_key }
      else
        format.html { render :edit }
        format.json { render json: @api_key.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def api_key_params
    params.require(get_api_key_name.underscore.to_sym).permit(:key)
  end

  def set_api_name
    @api_name = get_api_key_name
  end

  def get_api_key_name
    ApiKey.descendants.map { |api_key| api_key.to_s }.include?(params[:type]) ? params[:type] : 'HotmartApiKey'
  end

  def api_class
    get_api_key_name.constantize
  end

  def set_api_key_obj
    @api_key = current_user.send(params[:type].underscore).try(:first)
  end

end
