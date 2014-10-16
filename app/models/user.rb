class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Whenever I call one of the following methods, the calling
  # is delegated to 'api_keys' table to execute the query. Notice
  # that these methods are defined inside the 'api_key.rb' model so that
  # it can execute the query.
  delegate :helpscout_api_key, :hotmart_api_key, :mailchimp_api_key, to: :api_keys
  
  belongs_to :user_type
  has_many :notifications, dependent: :destroy
  has_many :activation_rules, dependent: :destroy
  has_many :api_keys, dependent: :destroy
  accepts_nested_attributes_for :api_keys

  before_create :generate_url_token,
                :set_as_non_admin
  after_create :generate_api_keys

  scope :find_by_token_and_hottok,
            lambda { |token_script, token_hotmart|
              joins(:api_keys).
              where(
                "users.token = ? AND api_keys.key = ? AND api_keys.type = ?",
                  token_script,
                  token_hotmart,
                  'HotmartApiKey'
                )
            }

  def admin?
    self.user_type.name == 'admin' ? true : false
  end

  private

  def generate_url_token
    self.token = random_string()
  end

  def set_as_non_admin
    self.user_type_id = UserType.find_by_name('client').id
  end

  # Used so that the controller can deal with only edit
  # and update actions (we don't have to deal with new
  # and create once the API Keys will be only updated)
  def generate_api_keys
    ApiKey.descendants.each do |api_key|
      self.send(api_key.to_s.underscore).create(key: '')
    end
  end

  def random_string
    begin
      token = SecureRandom.urlsafe_base64
      return token unless already_registered?(token)
    end
  end

  def already_registered?(token)
    User.find_by_token(token)
  end

end
