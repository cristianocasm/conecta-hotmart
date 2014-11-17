class MailchimpActuationRulesController < ApplicationController
  layout 'client'
  before_action :set_mailchimp_actuation_rule, only: [:show, :edit, :update, :destroy]

  # GET /actuation_rules
  # GET /actuation_rules.json
  def index
    @mailchimp_actuation_rules = current_user.mailchimp_actuation_rules.all
  end

  # GET /actuation_rules/1
  # GET /actuation_rules/1.json
  def show
  end

  # GET /actuation_rules/new
  def new
    @mailchimp_actuation_rule = MailchimpActuationRule.new
    params[:method].blank? ? force_user_choose_an_api_method : build_api_method_arguments
  end

  # GET /actuation_rules/1/edit
  def edit
  end

  # POST /actuation_rules
  # POST /actuation_rules.json
  def create
    @mailchimp_actuation_rule = current_user.mailchimp_actuation_rules.new(mailchimp_actuation_rule_params)

    respond_to do |format|
      if @mailchimp_actuation_rule.save
        format.html { redirect_to @mailchimp_actuation_rule, notice: 'Actuation rule was successfully created.' }
        format.json { render :show, status: :created, location: @mailchimp_actuation_rule }
      else
        @method = @mailchimp_actuation_rule.api_method
        format.html { render :new }
        format.json { render json: @mailchimp_actuation_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actuation_rules/1
  # PATCH/PUT /actuation_rules/1.json
  def update
    respond_to do |format|
      if @mailchimp_actuation_rule.update(mailchimp_actuation_rule_params)
        format.html { redirect_to @mailchimp_actuation_rule, notice: 'Actuation rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailchimp_actuation_rule }
      else
        format.html { render :edit }
        format.json { render json: @mailchimp_actuation_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actuation_rules/1
  # DELETE /actuation_rules/1.json
  def destroy
    @mailchimp_actuation_rule.destroy
    respond_to do |format|
      format.html { redirect_to @mailchimp_actuation_rule, notice: 'Actuation rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Used so that user can choose the api's method
  def force_user_choose_an_api_method
    @api_methods = MailchimpApiMethod.pluck(:id, :name)
  end

  def build_api_method_arguments
    @method = MailchimpApiMethod.find_by_name(params[:method])
    @mailchimp_actuation_rule.arguments = MailchimpActuationRule.mount_by_method(@method, current_user)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_mailchimp_actuation_rule
    @mailchimp_actuation_rule = MailchimpActuationRule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mailchimp_actuation_rule_params
    params.require(:mailchimp_actuation_rule).
              permit(
                :name,
                :description,
                :api_method_id,
                :actuation_params_attributes => [
                  :argument_id,
                  :value
                ]
              )
  end
end
