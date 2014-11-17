class RuleAssociationsController < ApplicationController
  layout 'client'
  before_action :set_rule_association, only: [:show, :edit, :update, :destroy]

  def index
    @activation_rules = current_user.activation_rules
  end

  def show
  end

  def new
    @rule_association = RuleAssociation.new
    @activation_rules = current_user.activation_rules
    @mailchimp_actuation_rules = current_user.mailchimp_actuation_rules
  end

  def edit
  end

  def create
    paramS = rule_association_params
    @activation_rule = current_user.activation_rules.find(paramS[:activation_rule_id])
    @mailchimp_actuation_rules = MailchimpActuationRule.find(paramS[:mailchimp_actuation_rule_id].reject { |el| el.blank? })

    respond_to do |format|
      if @activation_rule.mailchimp_actuation_rules << @mailchimp_actuation_rules
        format.html { redirect_to @activation_rule, notice: 'Associação criada com sucesso.' }
        format.json { render :show, status: :created, location: @rule_association }
      else
        format.html { render :new }
        format.json { render json: @activation_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    paramS = rule_association_params
    @activation_rule = current_user.activation_rules.find(paramS[:activation_rule_id])

    respond_to do |format|
      if @activation_rule.update_attributes(mailchimp_actuation_rule_ids: paramS[:mailchimp_actuation_rule_id])
        format.html { redirect_to @activation_rule, notice: 'Associação criada com sucesso.' }
        format.json { render :show, status: :created, location: @rule_association }
      else
        format.html { render :new }
        format.json { render json: @activation_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rule_association.destroy
    respond_to do |format|
      format.html { redirect_to @rule_association, notice: 'Associação excluída com sucesso' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rule_association
   @rule_association = RuleAssociation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rule_association_params
    params.require(:rule_association).
              permit(
                :activation_rule_id,
                :mailchimp_actuation_rule_id => []
              )
  end
end
