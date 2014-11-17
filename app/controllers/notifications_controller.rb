class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  skip_before_filter :authenticate_user!, only: :create

  def create
    user = User.find_by_hotmart_token_and_hottok(params[:token], params[:hottok]).try(:first)
    
    if user
      record_notification(user.id)

      user.activation_rules.each do |regra|
        if(regra.mailchimp_actuation_rules)
          runActuationRules(user, regra) if regra.activated?(params)
        end
      end

      render nothing: true, status: 200
    else
      render nothing: true, status: 401
    end
  end

  private

  def runActuationRules(user, rule)
    rule.mailchimp_actuation_rules.each { |act_rule| act_rule.run(user, params) }
  end

  def record_notification(user_id)
    HotmartNotification.create({
      hotmart_transaction: params[:transaction],
      phone_local_code: params[:phone_local_code],
      phone_number: params[:phone_number],
      prod_name: params[:prod_name],
      status: params[:status],      
      user_id: user_id,
      customer_email: params[:email],
      hottok: params[:hottok],
      prod: params[:prod],
      off: params[:off],
      price: params[:price],
      aff: params[:aff],
      aff_name: params[:aff_name],
      name: params[:name],
      first_name: params[:first_name],
      last_name: params[:last_name],
      doc: params[:doc],
      address: params[:address],
      address_number: params[:address_number],
      address_country: params[:address_country],
      address_district: params[:address_district],
      address_comp: params[:address_comp],
      address_city: params[:address_city],
      address_state: params[:address_state],
      address_zip_code: params[:address_zip_code],
      xcod: params[:xcod],
      src: params[:src],
      payment_engine: params[:payment_engine],
      payment_type: params[:payment_type],
      hotkey: params[:hotkey],
      name_subscription_plan: params[:name_subscription_plan],
      subscriber_code: params[:subscriber_code],
      cms_marketplace: params[:cms_marketplace],
      cms_vendor: params[:cms_vendor],
      cms_aff: params[:cms_aff],
      callback_type: params[:callback_type],
      subscription_status: params[:subscription_status],
      transaction_ext: params[:transaction_ext],
      sck: params[:sck],
      purchase_date: params[:purchase_date]
      })
  end
end
