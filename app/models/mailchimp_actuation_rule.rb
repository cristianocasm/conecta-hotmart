# == Schema Information
#
# Table name: mailchimp_actuation_rules
#
#  id                 :integer          not null, primary key
#  activation_rule_id :integer
#  api_method_id      :integer
#  name               :string(255)
#  description        :text(255)
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#

class MailchimpActuationRule < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_uniqueness_of :name

  belongs_to :api_method
  belongs_to :user

  has_many :rule_associations
  has_many :activation_rules ,through: :rule_associations

  has_many :actuation_params, dependent: :destroy
  has_many :arguments, through: :actuation_params
  accepts_nested_attributes_for :actuation_params#, :reject_if => lambda { |c| c[:value].blank? }

  def run(user, params)
    mailchimp = Mailchimp::API.new(user.mailchimp_api_key.first.key)
    method = self.api_method

    case method.name
    when 'subscribe' || 'update'
      arguments = self.arguments

      retorno = mailchimp.lists.subscribe(
        self.arguments.find_by_position(1).actuation_params.first.value, # id da lista (*list_id)
        { email: params[:email] }, # o e-mail a ser cadastrado (extraído de params) (*email)
        nil, #{ merge_vars: { groupings: [id: self.arguments.find_by_position(3).actuation_params.first.value]} },  # o nome dos grupos (*group_name)
        self.arguments.find_by_position(4).actuation_params.first.value,   # o tipo de email (text ou html) (*email_type)
        self.arguments.find_by_position(5).actuation_params.first.value,   # utilizar ou não double opt-in (*double_optin)
        self.arguments.find_by_position(6).actuation_params.first.value,   # permitir atualização de informações de usuário que já esteja cadastrado na lista (*update_existing)
        self.arguments.find_by_position(7).actuation_params.first.value,   # sobrescrever grupos de interesse ou adicionar os fornecidos aos atuais (*replace_interests)
        self.arguments.find_by_position(8).actuation_params.first.value    # envia email de boas vindas (*send_welcome)

        )

    puts retorno
    when 'unsubscribe'
      # mailchimp.lists.unsubscribe(...)
    end
  end

  def self.mount_by_method(method, user)
    method_arguments = method.arguments
    mailchimp_api = Mailchimp::API.new(user.mailchimp_api_key.first.key)

    case method.name
    when 'subscribe'
     mount_subscribe(method_arguments, mailchimp_api)
    when 'unsubscribe'
     mount_unsubscribe(method_arguments, mailchimp_api)
    when 'update-member'
     mount_update_member(method_arguments, mailchimp_api)
    end
  end

  # def self.set_activation_rule(mc_actuation_rules, activation_rule)
  #   self.where('id IN (?)', mc_actuation_rules).
  #     update_all(:activation_rule_id => activation_rule)
  # end

  private

  def self.mount_subscribe(arguments, mailchimp_api)
    arguments.each do |argument|
      api_param = argument.api_param

      if api_param.name == 'list_id'
        listas = mailchimp_api.lists.list
        api_param.accepted_values = listas["data"].map do |data|
                                      AcceptedValue.new(
                                        { value: data["id"],
                                          placeholder: data["name"]
                                        }
                                      )
                                    end
      elsif api_param.name == 'email'
        api_param.accepted_values = [AcceptedValue.new( value: 'Email do comprador' )]
       
      # elsif api_param.name == 'group_name'
      #  group_names = mailchimp_api.lists.interest_groupings 
      end
    end
  end

  def self.mount_unsubscribe(arguments, mailchimp_api)
    arguments.each do |argument|
      api_param = argument.api_param
       if api_param.name == 'list_id'
        listas = mailchimp_api.lists.list
        api_param.accepted_values = listas["data"].map do |data|
                                      AcceptedValue.new(
                                        { value: data["id"],
                                          placeholder: data["name"]
                                        }
                                      )
                                    end
      elsif api_param.name == 'email'
        api_param.accepted_values = [AcceptedValue.new( value: 'Email do comprador' )]
      # elsif api_param.name == 'group_name'
      #  group_names = mailchimp_api.lists.interest_groupings 
      end
    end
  end

  def self.mount_update_member(arguments, mailchimp_api)
    arguments.each do |argument|
      api_param = argument.api_param
      
      if api_param.name == 'list_id'
        listas = mailchimp_api.lists.list
        api_param.accepted_values = listas["data"].map do |data|
                                      AcceptedValue.new(
                                        { value: data["id"],
                                          placeholder: data["name"]
                                        }
                                      )
                                    end
      elsif api_param.name == 'email'
        api_param.accepted_values = [AcceptedValue.new( value: 'Email do comprador' )]
      # elsif api_param.name == 'group_name'
      #  group_names = mailchimp_api.lists.interest_groupings 
      end
     end
  end
end
