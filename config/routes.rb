Rails.application.routes.draw do

  # get 'user/update'

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  
  # Routes for STI api_params
  resources :helpscout_params, controller: 'api_params', type: 'HelpscoutParam'
  resources :hotmart_params, controller: 'api_params', type: 'HotmartParam'
  resources :mailchimp_params, controller: 'api_params', type: 'MailchimpParam'

  # Routes for STI api_keys
  resources :helpscout_api_keys, controller: 'api_keys', type: 'HelpscoutApiKey', only: [:edit, :update]
  resources :hotmart_api_keys, controller: 'api_keys', type: 'HotmartApiKey', only: [:edit, :update]
  resources :mailchimp_api_keys, controller: 'api_keys', type: 'MailchimpApiKey', only: [:edit, :update]

  resources :activation_rules

  # Routes for STI actuation_rule
  resources :mailchimp_actuation_rules, controller: 'actuation_rules', type: 'MailchimpActuationRule'
  resources :helpscout_actuation_rules, controller: 'actuation_rules', type: 'HelpscoutActuationRule'

  resources :notifications, only: [:index, :show]
  post "/notifications/:token", to: 'notifications#create'

  post "/helpscout_info/:token", to: 'helpscout_info#get_notification', as: 'helpscout_info'

end
