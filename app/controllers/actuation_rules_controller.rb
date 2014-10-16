class ActuationRulesController < ApplicationController
  layout 'client'
  before_action :set_rule_name
  before_action :set_actuation_rule, only: [:show, :edit, :update, :destroy]

  # GET /actuation_rules
  # GET /actuation_rules.json
  def index
    @actuation_rules = ActuationRule.all
  end

  # GET /actuation_rules/1
  # GET /actuation_rules/1.json
  def show
  end

  # GET /actuation_rules/new
  def new
    @actuation_rule = ActuationRule.new
  end

  # GET /actuation_rules/1/edit
  def edit
  end

  # POST /actuation_rules
  # POST /actuation_rules.json
  def create
    @actuation_rule = ActuationRule.new(actuation_rule_params)

    respond_to do |format|
      if @actuation_rule.save
        format.html { redirect_to @actuation_rule, notice: 'Actuation rule was successfully created.' }
        format.json { render :show, status: :created, location: @actuation_rule }
      else
        format.html { render :new }
        format.json { render json: @actuation_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actuation_rules/1
  # PATCH/PUT /actuation_rules/1.json
  def update
    respond_to do |format|
      if @actuation_rule.update(actuation_rule_params)
        format.html { redirect_to @actuation_rule, notice: 'Actuation rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @actuation_rule }
      else
        format.html { render :edit }
        format.json { render json: @actuation_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actuation_rules/1
  # DELETE /actuation_rules/1.json
  def destroy
    @actuation_rule.destroy
    respond_to do |format|
      format.html { redirect_to actuation_rules_url, notice: 'Actuation rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_rule_name
    @actuation_rule_name = get_actuation_rule_name
  end

  def get_actuation_rule_name
    ActuationRule.to_s
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_actuation_rule
    @actuation_rule = ActuationRule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def actuation_rule_params
    params.require(:actuation_rule).permit(:name, :description)
  end
end
