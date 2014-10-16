class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  skip_before_filter :authenticate_user!, only: :create

  def create
    user = User.find_by_token_and_hottok(params[:token], params[:hottok]).try(:first)

    user.activation_rules.each do |regra|
      runActuationRules(user, regra) if regra.activated?(params)
    end
    
    if user
      render nothing: true, status: 200
    else
      render nothing: true, status: 401
    end
  end

  private

  def runActuationRules(user, rule)
    rule.actuation_rules.each { |act_rule| act_rule.run(user, params) }
  end
end
