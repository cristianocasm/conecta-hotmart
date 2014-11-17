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

  def create
    paramS = rule_association_params
    @activation_rule = current_user.activation_rules.find(paramS[:activation_rule_id])

    respond_to do |format|
      if @activation_rule.update_attributes(mailchimp_actuation_rule_ids: paramS[:mailchimp_actuation_rule_id])
        format.html { redirect_to rule_association_url(@activation_rule), notice: 'Associação criada com sucesso.' }
        format.json { render :show, status: :created, location: @rule_association }
      else
        format.html { render :new }
        format.json { render json: @activation_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activation_rule.rule_associations.destroy_all
    respond_to do |format|
      format.html { redirect_to rule_associations_url, notice: 'Associação excluída com sucesso' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rule_association
   @activation_rule = current_user.activation_rules.find_by_id(params[:id])
   check_ownership(@activation_rule, rule_associations_url)
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
