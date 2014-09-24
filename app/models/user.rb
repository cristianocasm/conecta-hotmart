class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :api_keys
  has_many :notifications
  belongs_to :user_type

  before_create :generate_url_token

  def admin?
    true if self.user_type.name == 'admin'
  end

  def api_key(api)
    return if api.blank?
    
    api_id = Api.find_by_name(api).try(:id)
    self.api_keys.where("api_keys.api_id = #{api_id}").try(:first)
  end

  # Retrieves user's API's key when called as following:
  # *hotmart_api_key    - hotmart's api's key
  # *mailchimp_api_key  - mailchimp's api's key
  # *helpscout_api_key  - helpscout's api's key
  def method_missing(method, *args)
    api_name = method.to_s.match(/^(\w+)_api_key/).try(:[], 1)
    if api_name
      self.api_key(api_name).try(:key)
    else
      super
    end
  end

  private

  def generate_url_token
    self.token = random_string()
  end

  def random_string
    begin
      token = SecureRandom.urlsafe_base64
      user = User.find_by_token(token)
      return token if user.nil?
    end
  end

end
