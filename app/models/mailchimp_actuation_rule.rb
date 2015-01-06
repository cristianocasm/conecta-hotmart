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
        ap = self.actuation_params
        retorno = mailchimp.lists.subscribe(
          self.arguments.find_by_position(1).actuation_params.where(id: ap.map(&:id)).first.value, # id da lista (*list_id)
          { email: params[:email] },                                                               # o e-mail a ser cadastrado (extraído de params) (*email)
          mount_groupings(params[:email]),                                                                         # o nome dos grupos (*group_name)
          self.arguments.find_by_position(4).actuation_params.where(id: ap.map(&:id)).first.value, # o tipo de email (text ou html) (*email_type)
          self.arguments.find_by_position(5).actuation_params.where(id: ap.map(&:id)).first.value, # utilizar ou não double opt-in (*double_optin)
          self.arguments.find_by_position(6).actuation_params.where(id: ap.map(&:id)).first.value, # permitir atualização de informações de usuário que já esteja cadastrado na lista (*update_existing)
          self.arguments.find_by_position(7).actuation_params.where(id: ap.map(&:id)).first.value, # sobrescrever grupos de interesse ou adicionar os fornecidos aos atuais (*replace_interests)
          self.arguments.find_by_position(8).actuation_params.where(id: ap.map(&:id)).first.value  # envia email de boas vindas (*send_welcome)
          )
      rescue => e
        logger.info "**************Exceção lançada no método subscribe do Mailchimp***************"
        return build_returning(:error, e.message, rule_id)
      else
        logger.info "**************Retorno considerado sucesso no método subscribe do Mailchimp***************"
        logger.info retorno
        return build_returning(:success, "E-mail cadastrado na lista com sucesso", rule_id)
      end
    when 'unsubscribe'
      begin
        ap = self.actuation_params
        retorno = mailchimp.lists.unsubscribe(
          self.arguments.find_by_position(1).actuation_params.where(id: ap.map(&:id)).first.value, # id da lista (*list_id)
          { email: params[:email] }, # o e-mail a ser cadastrado (extraído de params) (*email)
          self.arguments.find_by_position(3).actuation_params.where(id: ap.map(&:id)).first.value, # o tipo de email (text ou html) (*email_type)
          self.arguments.find_by_position(4).actuation_params.where(id: ap.map(&:id)).first.value, # utilizar ou não double opt-in (*double_optin)
          self.arguments.find_by_position(5).actuation_params.where(id: ap.map(&:id)).first.value
          )
      rescue => e
        logger.info "**************Exceção lançada no método unsubscribe do Mailchimp***************"
        logger.info retorno
        return build_returning(:error, e.message, rule_id)
      else
        logger.info "**************Retorno considerado sucesso no método unsubscribe do Mailchimp***************"
        logger.info "Enviado:
          #{self.arguments.find_by_position(1).actuation_params.where(id: ap.map(&:id)).first.value} \n
          #{{ email: params[:email] }} \n
          #{self.arguments.find_by_position(3).actuation_params.where(id: ap.map(&:id)).first.value} \n
          #{self.arguments.find_by_position(4).actuation_params.where(id: ap.map(&:id)).first.value} \n
          #{self.arguments.find_by_position(5).actuation_params.where(id: ap.map(&:id)).first.value} \n"
        logger.info retorno
        return build_returning(:success, "E-mail descadastrado da lista com sucesso", rule_id)
      end
    when  'update'
      begin
        ap = self.actuation_params
        retorno = mailchimp.lists.update_member(
          self.arguments.find_by_position(1).actuation_params.where(id: ap.map(&:id)).first.value, # id da lista (*list_id)
          { email: params[:email] },
          mount_groupings(params[:email]),                                                                         # o nome dos grupos (*group_name)
          self.arguments.find_by_position(3).actuation_params.where(id: ap.map(&:id)).first.value, # o tipo de email (text ou html) (*email_type)
          self.arguments.find_by_position(4).actuation_params.where(id: ap.map(&:id)).first.value  # sobrescrever grupos de interesse ou adicionar os fornecidos aos atuais (*replace_interests)
          )
      rescue => e
        logger.info "**************Exceção lançada no método update do Mailchimp***************"
        logger.info retorno
        return build_returning(:error, e.message, rule_id)
      else
        logger.info "**************Retorno considerado sucesso no método update do Mailchimp***************"
        logger.info retorno
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

  def mount_groupings(email)
    ap = self.actuation_params
    params = self.arguments.find_by_position('3').actuation_params.where(id: ap.map(&:id))
    list_groupings = params.map(&:value) unless params.blank? # pegando lista de ids da lista e ids dos grupos no formato "listid_groupid"
    groupings = []
    
    while !list_groupings.blank?
      groups = []
      list_id = list_groupings.first.split("_").first
      list_id_regex = Regexp.new(list_id+"_") # pegando "listid_" do primeiro elemento do array
      lg_by_list_id = list_groupings.select { |lg| lg =~ list_id_regex } # pegando todos os elementos da mesma lista
      list_groupings -= lg_by_list_id # removendo os elementos do array
      lg_by_list_id.each do |lg|
        group = lg.split("_").second
        groups << group
      end
      groupings << { id: list_id, groups: groups }
    end

    if groupings.blank?
      return nil
    else
      return {
              merge_vars: { 'new-email' => email,
                            'groupings' => groupings
                          }
             }
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
