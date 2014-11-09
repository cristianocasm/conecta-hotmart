class HelpscoutInfoController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :get_notification
  skip_before_filter :authenticate_user!, only: :get_notification

  def get_notification
    Rails.logger.info "******\n"
    Rails.logger.info "Params: #{params}\n"
    
    # data = params[:helpscout_info].keep_if { |key, val| ["ticket", "customer"].include? key }.to_s
    data = params[:helpscout_info].to_json
    signature = request.headers["HTTP_X_HELPSCOUT_SIGNATURE"]
    user = User.find_by_helpscout_token(params[:token])
    secret_key = user.
                  try(:helpscout_api_key).
                  try(:first).
                  try(:key)

    Rails.logger.info "data: #{data}"
    Rails.logger.info "signature: #{signature}"
    Rails.logger.info "secret_key: #{secret_key}"
    Rails.logger.info "******\n"


    if is_from_help_scout?(data, signature, secret_key)
      HotmartNotification.find_by_user_id(user)
      render nothing: true, status: 200
    else
      render nothing: true, status: 401
    end
  end

  private

  # require 'openssl'
  # require 'base64'

  # WEBHOOK_SECRET_KEY = "your secret key"

  def is_from_help_scout?(data, signature, secret_key)
    return false if data.nil? || signature.nil? || secret_key.nil?
    Rails.logger.info "ENTREI!!!!!!!!!!!!!!!!!!!!"
    hmac = OpenSSL::HMAC.digest('sha1', secret_key, data)
    Rails.logger.info "#{Base64.encode64(hmac).strip == signature.strip}"
    Base64.encode64(hmac).strip == signature.strip
  end

  # def helpscout_signature(data, token)
  #   hmac = OpenSSL::HMAC.digest('sha1', token, data)
  #   Base64.encode64(hmac.strip)
  # end
end