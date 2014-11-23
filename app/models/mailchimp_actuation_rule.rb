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
  validates_uniqueness_of :name, scope: :user_id

  belongs_to :api_method
  belongs_to :user

  has_many :rule_associations
  has_many :activation_rules ,through: :rule_associations

  has_many :actuation_params, dependent: :destroy
  has_many :arguments, through: :actuation_params
  accepts_nested_attributes_for :actuation_params#, :reject_if => lambda { |c| c[:value].blank? }

  def run(user, params, rule_id)
    mailchimp = Mailchimp::API.new(user.mailchimp_api_key.first.key)
    method = self.api_method

    case method.name
    when 'subscribe'
      begin
        retorno = mailchimp.lists.subscribe(
          self.arguments.find_by_position(1).actuation_params.first.value, # id da lista (*list_id)
          { email: params[:email] }, # o e-mail a ser cadastrado (extraído de params) (*email)
          mount_groupings,  # o nome dos grupos (*group_name)
          self.arguments.find_by_position(4).actuation_params.first.value,   # o tipo de email (text ou html) (*email_type)
          self.arguments.find_by_position(5).actuation_params.first.value,   # utilizar ou não double opt-in (*double_optin)
          self.arguments.find_by_position(6).actuation_params.first.value,   # permitir atualização de informações de usuário que já esteja cadastrado na lista (*update_existing)
          self.arguments.find_by_position(7).actuation_params.first.value,   # sobrescrever grupos de interesse ou adicionar os fornecidos aos atuais (*replace_interests)
          self.arguments.find_by_position(8).actuation_params.first.value    # envia email de boas vindas (*send_welcome)
          )
      rescue => e
        return build_returning(:error, e.message, rule_id)
      else
        return build_returning(:success, "E-mail cadastrado na lista com sucesso", rule_id)
      end
    when 'unsubscribe'
      begin
        retorno = mailchimp.lists.unsubscribe(
          self.arguments.find_by_position(1).actuation_params.first.value, # id da lista (*list_id)
          { email: params[:email] }, # o e-mail a ser cadastrado (extraído de params) (*email)
          self.arguments.find_by_position(3).actuation_params.first.value,   # o tipo de email (text ou html) (*email_type)
          self.arguments.find_by_position(4).actuation_params.first.value,   # utilizar ou não double opt-in (*double_optin)
          self.arguments.find_by_position(5).actuation_params.first.value, 
          )
      rescue => e
        return build_returning(:error, e.message, rule_id)
      else
        return build_returning(:success, "E-mail descadastrado da lista com sucesso", rule_id)
      end
    when  'update'
      begin
      retorno = mailchimp.lists.update_member(
        self.arguments.find_by_position(1).actuation_params.first.value, # id da lista (*list_id)
        { email: params[:email] },
        mount_groupings,  # o nome dos grupos (*group_name)
        self.arguments.find_by_position(3).actuation_params.first.value,   # o tipo de email (text ou html) (*email_type)
        self.arguments.find_by_position(4).actuation_params.first.value,   # sobrescrever grupos de interesse ou adicionar os fornecidos aos atuais (*replace_interests)
        )
      rescue => e
        return build_returning(:error, e.message, rule_id)
      else
        return build_returning(:success, "Atualizado com sucesso", rule_id)
      end
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

  private

  def mount_groupings
    params = self.arguments.find_by_position('3').actuation_params.where("mailchimp_actuation_rule_id = ?", self.id)
    list_groupings = params.map(&:value) unless params.blank? # pegando lista de ids da lista e ids dos grupos no formato "listid_groupid"
    groupings = []
    
    while !list_groupings.blank?
      list_id = list_groupings.first.split("_").first
      list_id_regex = Regexp.new(list_id+"_") # pegando "listid_" do primeiro elemento do array
      lg_by_list_id = list_groupings.select { |lg| lg =~ list_id_regex } # pegando todos os elementos da mesma lista
      list_groupings -= lg_by_list_id # removendo os elementos do array
      lg_by_list_id.each do |lg|
        group = lg.split("_").second
        groupings << { id: list_id, group: group }
      end
    end

    if groupings.blank?
      return nil
    else
      return { merge_vars: { groupings: groupings } }
    end
  end

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
      # elsif api_param.name == 'group_name'
      #  group_names = mailchimp_api.lists.interest_groupings 
      end
     end
  end

  def build_returning(msg_type, msg, rule_id)
    h = Hash.new
    h.store(:name, self.name)
    h.store(:activation_rule, rule_id)
    h.store(msg_type, msg)
    return h
  end
end
