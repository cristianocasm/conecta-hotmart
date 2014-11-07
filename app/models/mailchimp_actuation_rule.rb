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

class MailchimpActuationRule < ActuationRule
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

  def self.mount_subscribe(arguments, mailchimp_api)
    arguments.each do |argument|
      api_param = argument.api_param

      if api_param.name == 'list_id'
        listas = mailchimp_api.lists.list
        api_param.accepted_values = listas["data"].map { |data| AcceptedValue.new(value: data["id"]) }
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
        api_param.accepted_values = listas["data"].map { |data| AcceptedValue.new(value: data["id"]) }
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
        api_param.accepted_values = listas["data"].map { |data| AcceptedValue.new(value: data["id"]) }
      elsif api_param.name == 'email'
        api_param.accepted_values = [AcceptedValue.new( value: 'Email do comprador' )]
      # elsif api_param.name == 'group_name'
      #  group_names = mailchimp_api.lists.interest_groupings 
      end
    end
  end

end
