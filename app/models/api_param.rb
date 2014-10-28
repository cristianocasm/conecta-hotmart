# == Schema Information
#
# Table name: api_params
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  description             :text(255)
#  type                    :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  data_type_id            :integer
#  show_in_activation_rule :boolean          default(FALSE)
#

class ApiParam < ActiveRecord::Base

  validates_presence_of :name, :description, :data_type_id
  validates_uniqueness_of :name, scope: [:type]

  # scopes for inherited models
  scope :helpscout_params, -> { where(type: 'HelpscoutParam') } 
  scope :hotmart_params, -> { where(type: 'HotmartParam') } 
  scope :mailchimp_params, -> { where(type: 'MailchimpParam') }

  has_many :accepted_values, dependent: :destroy
  accepts_nested_attributes_for :accepted_values, reject_if: :all_blank, :allow_destroy => true

  has_many :actuation_params
  has_many :arguments

  belongs_to :data_type

  # #relationships that allow me to find an api params' parents and children
  # has_many :nested_params
  # has_many :child_params, :through => :nested_params
  # has_many :parent_api_params, :class_name => "NestedParam", :foreign_key => "child_param_id"
  # has_many :parent_params, :through => :parent_api_params, :source => :api_param

end
