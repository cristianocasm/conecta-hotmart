class ApiParam < ActiveRecord::Base

  validates_presence_of :name, :description
  validates_uniqueness_of :name, scope: [:type, :struct, :required]

  # scopes for inherited models
  scope :helpscout_params, -> { where(type: 'HelpscoutParam') } 
  scope :hotmart_params, -> { where(type: 'HotmartParam') } 
  scope :mailchimp_params, -> { where(type: 'MailchimpParam') }

  has_many :accepted_values, dependent: :destroy

  # relationship that allow me to find an api params' parents and children
  has_many :nested_params
  has_many :child_params, :through => :nested_params
  has_many :parent_api_params, :class_name => "NestedParam", :foreign_key => "child_param_id"
  has_many :parent_params, :through => :parent_api_params, :source => :api_param

  # list of api_params' descendant classes
  def self.types
    %w[HelpscoutParam MailchimpParam HotmartParam]
  end

end
