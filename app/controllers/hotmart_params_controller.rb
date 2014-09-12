class HotmartParamsController < ApplicationController
  before_action :set_hotmart_param, only: [:show, :edit, :update, :destroy]

  # GET /hotmart_params
  # GET /hotmart_params.json
  def index
    @hotmart_params = HotmartParam.all
  end

  # GET /hotmart_params/1
  # GET /hotmart_params/1.json
  def show
  end

  # GET /hotmart_params/new
  def new
    @hotmart_param = HotmartParam.new
  end

  # GET /hotmart_params/1/edit
  def edit
  end

  # POST /hotmart_params
  # POST /hotmart_params.json
  def create
    @hotmart_param = HotmartParam.new(hotmart_param_params)

    respond_to do |format|
      if @hotmart_param.save
        format.html { redirect_to @hotmart_param, notice: 'Hotmart param was successfully created.' }
        format.json { render :show, status: :created, location: @hotmart_param }
      else
        format.html { render :new }
        format.json { render json: @hotmart_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotmart_params/1
  # PATCH/PUT /hotmart_params/1.json
  def update
    respond_to do |format|
      if @hotmart_param.update(hotmart_param_params)
        format.html { redirect_to @hotmart_param, notice: 'Hotmart param was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotmart_param }
      else
        format.html { render :edit }
        format.json { render json: @hotmart_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotmart_params/1
  # DELETE /hotmart_params/1.json
  def destroy
    @hotmart_param.destroy
    respond_to do |format|
      format.html { redirect_to script_api_path(@api_name), notice: 'Hotmart param was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotmart_param
      @hotmart_param = HotmartParam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotmart_param_params
      params.require(:hotmart_param).permit(:name, :description)
    end
end
