class HelpscoutInfoController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :get_notification
  skip_before_filter :authenticate_user!, only: :get_notification

  def get_notification    
    data = params[:helpscout_info].to_json
    signature = request.headers["HTTP_X_HELPSCOUT_SIGNATURE"]
    user = User.find_by_helpscout_token(params[:token])
    secret_key = user.
                  try(:helpscout_api_key).
                  try(:first).
                  try(:key)

    Rails.logger.info "params: #{params}"
    Rails.logger.info "signature: #{signature}"
    Rails.logger.info "secret_key: #{secret_key}"

    if is_from_help_scout?(data, signature, secret_key)
      Rails.logger.info "ENTREI!!!!!!!!!"
      notifications = HotmartNotification.
                        find_latest_notifications_per_product(
                          user.id,
                          params[:helpscout_info][:customer][:email]
                        )
      html = build_html_response(notifications, user)
      Rails.logger.info html
      # render nothing: true, status: 200
      render json: html.encode, status: 200
    else
      Rails.logger.info "!!!!!!!!!!!!!!NÃO ENTREI!!!!!!!!!"
      render nothing: true, status: 200
    end
  end

  private

  def is_from_help_scout?(data, signature, secret_key)
    return false if data.nil? || signature.nil? || secret_key.nil?
    hmac = OpenSSL::HMAC.digest('sha1', secret_key, data)
    Base64.encode64(hmac).strip == signature.strip
  end

  def build_html_response(notifications, user)
    html = nil
    
    unless notifications.blank?
      ntfc = notifications.first
      html = 
      "<h4>#{user.name.humanize}</h4>
        <p class='muted'>(#{ntfc.phone_local_code}) #{ntfc.phone_number}</p>
            TRANS
            STAT
            PROD
        "

      notifications.each do |notif|
        html.gsub!(/TRANS/) { "<ul> <li>Transação: #{notif.hotmart_transaction} </li>" }
        html.gsub!(/STAT/) { "<li>Status: #{notif.status} </li>" }
        html.gsub!(/PROD/) { "<li>Produto: #{notif.prod_name} </li></ul>
            TRANS
            STAT
            PROD" }
        html + "TRANS STAT PROD"
      end

      html.gsub(/TRANS|STAT|PROD/,"")
    end

    return html
  end
end