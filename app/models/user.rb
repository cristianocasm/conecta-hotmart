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
