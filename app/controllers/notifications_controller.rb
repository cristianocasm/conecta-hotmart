class NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  skip_before_filter :authenticate_user!, only: :create

  before_action :set_notification, only: [:destroy]
  layout 'client'

  def index
    @logs = current_user.notifications
  end

  def show
    @notification = current_user.
                      notifications.
                      find(params[:id]).
                      try(:hotmart_notification)
    check_ownership(@notification, notifications_url)
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to @notification,
                                notice: 'Notificação excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  def create
    user = User.
            find_by_hotmart_token_and_hottok(
              params[:token],
              params[:hottok]
            ).try(:first)
    
    if user
      msgs = 
        user.activation_rules.map do |regra|
          if(regra.mailchimp_actuation_rules)
            runActuationRules(user, regra) if regra.activated?(params)
          end
        end

      record_notification(user.id, msgs)

      render nothing: true, status: 200
    else
      render nothing: true, status: 401
    end
  end

  private

  def set_notification
    @notification = Notification.
                    find_by_id(params[:id])
    check_ownership(@notification, notifications_url)
  end

  def runActuationRules(user, rule)
    rule.mailchimp_actuation_rules.map { |act_rule| act_rule.run(user, params, rule.id) }
  end

  def record_notification(user_id, msgs)
    hn = record_hotmart_notification(user_id)

    msgs.each do |acti_msg|
      mc_msg = ""
      acti_msg.each do |mc_actuation_msg|
        mc_msg += "(#{mc_actuation_msg[:name]}) #{mc_actuation_msg[:error] || mc_actuation_msg[:success]}\n"
      end unless acti_msg.blank?

      Notification.create!(
        user_id: user_id,
        activation_rule_id: acti_msg.try(:first).try(:[], :activation_rule),
        hotmart_notification_id: hn.try(:id),
        mailchimp_response: mc_msg
        )
    end
  end

  def record_hotmart_notification(user_id)
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
