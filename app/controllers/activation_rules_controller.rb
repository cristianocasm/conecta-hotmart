class ActivationRulesController < ApplicationController
  layout 'client'
  before_action :set_rule_name
  before_action :set_activation_rule, only: [:show, :edit, :update, :destroy]
  before_action :check_whether_api_key_was_created

  # GET /rules
  # GET /rules.json
  def index
    @activation_rules = current_user.activation_rules
  end

  # GET /rules/1
  # GET /rules/1.json
  def show
  end

  # GET /rules/new
  def new
    if params[:id].blank?
      @activation_rule = ActivationRule.new
      @activation_rule.api_params = HotmartParam.allowed_in_activation_rule
    else
      @activation_rule = ActivationRule.duplicate(params[:id])
      # @activation_rule = ActivationRule.new(ActivationRule.find_by_id(params[:id]).attributes)
      # @activation_rule.activation_params.each do |ap|
      #   ap.id = nil
      # end
    end
  end

  # GET /rules/1/edit
  def edit
  end

  # POST /rules
  # POST /rules.json
  def create
    @activation_rule = ActivationRule.new(activation_rule_params)
    @activation_rule.user = current_user

    respond_to do |format|
      if @activation_rule.save
        format.html { redirect_to @activation_rule,
                                  notice: 'Regra criada com sucesso' }
        format.json { render :show,
                              status: :created,
                              location: @activation_rule }
      else
        format.html { render :new }
        format.json { render json: @activation_rule.errors,
                              status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rules/1
  # PATCH/PUT /rules/1.json
  def update
    respond_to do |format|
      if @activation_rule.update(activation_rule_params)
        format.html { redirect_to @activation_rule,
                                  notice: 'Regra atualizada com sucesso' }
        format.json { render :show,
                              status: :ok,
                              location: @activation_rule }
      else
        format.html { render :edit }
        format.json { render json: @activation_rule.errors,
                                    status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @activation_rule.destroy
    respond_to do |format|
      format.html { redirect_to activation_rules_url,
                                notice: 'Regra excluída com sucesso' }
      format.json { head :no_content }
    end
  end

  private

  def check_whether_api_key_was_created
    apiKeyObj = current_user.hotmart_api_key.first
    redirect_to edit_hotmart_api_key_path(apiKeyObj.id),
        alert: "Para acessar esta área informe abaixo \
                  seu token do Hotmart." if apiKeyObj.key.blank?
  end

  def set_rule_name
    @activation_rule_name = get_activation_rule_name
  end

  def get_activation_rule_name
    ActivationRule.to_s
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_activation_rule
    @activation_rule = current_user.activation_rules.find_by_id(params[:id])
    check_ownership(@activation_rule, activation_rules_url)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def activation_rule_params
    params.
      require(:activation_rule).
      permit(
        :name,
        :description,
        :activation_params_attributes => [
            :id,
            :api_param_id,
            :value
          ]
        )
  end
end
