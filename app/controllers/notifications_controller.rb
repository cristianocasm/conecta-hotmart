class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  skip_before_filter :authenticate_user!, only: :create

  def create
    user = User.find_by_hotmart_token_and_hottok(params[:token], params[:hottok]).try(:first)
    
    if user
      user.activation_rules.each do |regra|
        runActuationRules(user, regra) if regra.activated?(params)
      end

      record_notification()

      render nothing: true, status: 200
    else
      render nothing: true, status: 401
    end
  end

  private

  def runActuationRules(user, rule)
    rule.actuation_rules.each { |act_rule| act_rule.run(user, params) }
  end

  def record_notification
    HotmartNotification.create({
      transaction: params[:transaction],
      phone_local_code: params[:phone_local_code],
      phone_number: params[:phone_number],
      prod_name: params[:prod_name],
      status: params[:status]
      })
  end
end
