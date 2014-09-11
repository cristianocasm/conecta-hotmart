class ApiParamsController < ApplicationController
  before_action :set_api_name

  def index
    @api_params = api_class.all
  end

  def show
  end

  def new
  end

  def edit
    @api_param = api_class.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_api_name
    @api_name = api_name
  end

  def api_name
    ApiParam.types.include?(params[:type]) ? params[:type] : 'ApiParam'
  end

  def api_class
    api_name.constantize
  end

end
