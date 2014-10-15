class ApiParamsController < ApplicationController
  before_action :set_api_name
  before_action :set_api_obj, only: [:show, :edit, :update, :destroy]

  def index
    @api_params = api_class.all
  end

  def show
  end

  def new
    @api_param = api_class.new
    @api_param.accepted_values.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @api_param }
    end
  end

  def edit
    @api_param.accepted_values.build
  end

  def create
    @api_param = api_class.new(api_param_params)

    respond_to do |format|
      if @api_param.save
        format.html { redirect_to @api_param, notice: 'Param was successfully created.' }
        format.json { render :show, status: :created, location: @api_param }
      else
        format.html { render :new }
        format.json { render json: @api_param.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @api_param.update(api_param_params)
        format.html { redirect_to @api_param, notice: 'Param was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_param }
      else
        format.html { render :edit }
        format.json { render json: @api_param.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @api_param.destroy
    respond_to do |format|
      format.html { redirect_to @api_param, notice: 'Param was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_api_name
    @api_name = get_api_name
  end

  def get_api_name
    ApiParam.descendants.map { |api| api.to_s }.include?(params[:type]) ? params[:type] : 'HotmartParam'
  end

  def api_class
    get_api_name.constantize
  end

  def set_api_obj
    @api_param = api_class.find(params[:id])
  end

  def api_param_params
    params.
      require(get_api_name.underscore.to_sym).
      permit(
        :name,
        :description,
        :data_type_id,
        :show_in_activation_rule,
        :accepted_values_attributes => [
          :id,
          :value,
          :_destroy
        ]
      )
  end

end
