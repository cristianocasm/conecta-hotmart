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

    if is_from_help_scout?(data, signature, secret_key)
      notifications = HotmartNotification.
                        find_latest_notifications_per_product(
                          user.id,
                          params[:helpscout_info][:customer][:email]
                        )
      html = build_success_html_response(notifications, user)

      render json: html, status: 200
    else
      html = build_failure_html_response

      render nothing: true, status: 200
    end
  end

  private

  def is_from_help_scout?(data, signature, secret_key)
    return false if data.nil? || signature.nil? || secret_key.nil?
    hmac = OpenSSL::HMAC.digest('sha1', secret_key, data)
    Base64.encode64(hmac).strip == signature.strip
  end

  def build_success_html_response(notifications, user)
    html = nil
    
    unless notifications.blank?
      ntfc = notifications.first
      html = 
      "<h4>#{user.name.humanize}</h4>
        <p class='muted'>(#{ntfc.phone_local_code}) #{ntfc.phone_number}</p>
            PROD
            TRANS
            STAT
        "

      notifications.each do |notif|
        html.gsub!(/PROD/) { "<ul>
                                <li>Produto: #{notif.prod_name}</li>" }
        html.gsub!(/TRANS/) { " <ul>
                                  <li>Transação: #{notif.hotmart_transaction}</li>" }
        html.gsub!(/STAT/) { "    <li>Status: #{notif.status} </li>
                                </ul>
                              </ul>
            PROD
            TRANS
            STAT" }
        html + "TRANS STAT PROD"
      end

      html.gsub!(/TRANS|STAT|PROD/,"")
    end

    return { html: html }.to_json.encode
  end

  def build_failure_html_response
    { html: "<h4>Cliente sem histórico</h4>" }.to_json.encode
  end
end