# == Schema Information
#
# Table name: actuation_rules
#
#  id                 :integer          not null, primary key
#  activation_rule_id :integer
#  method_id          :integer
#  name               :string(255)
#  description        :text(255)
#  created_at         :datetime
#  updated_at         :datetime
#  type               :string(255)
#

class ActuationRule < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name, scope: [:type]

  belongs_to :activation_rule
  belongs_to :api_method

  has_many :actuation_params, dependent: :destroy
  has_many :arguments, through: :actuation_params
  accepts_nested_attributes_for :actuation_params, :reject_if => lambda { |c| c[:value].blank? }

  def run(user, params)
    mailchimp = Mailchimp::API.new(user.mailchimp_api_key)
    helpscout = HelpScout::Client.new(user.helpscout_api_key)
    method = self.method
    case method.module.api_name
    when 'mailchimp'
      case method.name
      when 'subscribe' || 'update'
        arguments = self.arguments

        # mailchimp.lists.subscribe(
        #   arguments.argument_1(params),                   # id da lista (*list_id)
        #   email: { email: arguments.argument_2(params) }, # o e-mail a ser cadastrado (extraído de params) (*email)
        #   merge_vars: arguments.argument_3(params),       # o nome dos grupos (*group_name)
        #   arguments.argument_4(params),                   # o tipo de email (text ou html) (*email_type)
        #   arguments.argument_5(params),                   # utilizar ou não double opt-in (*double_optin)
        #   arguments.argument_6(params),                   # permitir atualização de informações de usuário que já esteja cadastrado na lista (*update_existing)
        #   arguments.argument_7(params),                   # sobrescrever grupos de interesse ou adicionar os fornecidos aos atuais (*replace_interests)
        #   arguments.argument_8(params)                    # envia email de boas vindas (*send_welcome)
        #   # string id,              # The list id
        #   # struct email,           # Struct, mas terá apenas email
        #   # struct merge_vars,      # OPT - Struct - atente-se para groupings (o qual possui groups - array)
        #   # string email_type,      # OPT - string (html ou text)
        #   # bool double_optin,      # OPT - control whether a double opt-in confirmation message is sent
        #   # bool update_existing,   # OPT - flag to control whether existing subscribers should be updated instead of throwing an error
        #   # bool replace_interests, # OPT - determine whether we replace the interest groups with the groups provided or we add the provided groups to the member's interest groups (optional, defaults to true)
        #   # bool send_welcome       # OPT - optional if your double_optin is false and this is true, we will send your lists Welcome Email if this subscribe succeeds - this will *not* fire if we end up updating an existing subscriber. If double_optin is true, this has no effect. defaults to false.
        #   )
      when 'unsubscribe'
        # mailchimp.lists.unsubscribe(...)
      end
    when 'helpscout'
      # case self.action.name
      # when 'condition'
      #   helpscoutApi.some_module.some_method(...)
      # when 'condition'
      #   helpscoutApi.another_module.another_method(...)
      # end
    end
  end
end
