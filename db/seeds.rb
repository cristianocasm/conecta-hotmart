puts "Starting db seed"
Rails.application.eager_load!

UserType.create([
  { name: 'admin',
    description: 'Admin'},
  { name: 'client',
    description: 'Client'}
  ])

# puts "Iniciando criação de usuários para testes!!!! Remova esta parte quando estiver criando banco em produção!!!!"
User.create!([
  { name: 'Caio Ferreira',
    password: '12345678',
    password_confirmation: '12345678',
    email: 'caiolufer@gmail.com',
    user_type_id: UserType.find_by_name('admin').id }
  # { name: 'Client',
  #   password: '12345678',
  #   password_confirmation: '12345678',
  #   email: 'cristiano.souza.mendonca+client@gmail.com',
  #   user_type_id: UserType.find_by_name('client').id }
  ])

# HotmartNotification.create!([
#   {
#     hotmart_transaction: 'abcd',
#     phone_local_code: '31',
#     phone_number: '3333-4444',
#     prod_name: 'Como importar da Libéria',
#     status: 'started',
#     user_id: User.first.id,
#     customer_email: 'test@test.com'
#   },
#   {
#     hotmart_transaction: 'efg',
#     phone_local_code: '31',
#     phone_number: '3333-4444',
#     prod_name: 'Como importar da Libéria',
#     status: 'approved',
#     user_id: User.first.id,
#     customer_email: 'test@test.com'
#   },
#   {
#     hotmart_transaction: 'hij',
#     phone_local_code: '31',
#     phone_number: '3333-4444',
#     prod_name: 'Como importar da Libéria',
#     status: 'canceled',
#     user_id: User.first.id,
#     customer_email: 'test@test.com'
#   },
#   {
#     hotmart_transaction: 'klm',
#     phone_local_code: '31',
#     phone_number: '3333-4444',
#     prod_name: 'Como importar da Libéria',
#     status: 'chargeback',
#     user_id: User.first.id,
#     customer_email: 'test@test.com'
#   },
#   {
#     hotmart_transaction: 'ABCD',
#     phone_local_code: '31',
#     phone_number: '3333-4444',
#     prod_name: 'Como importar da China',
#     status: 'started',
#     user_id: User.first.id,
#     customer_email: 'test@test.com'
#   },
#   {
#     hotmart_transaction: 'EFG',
#     phone_local_code: '31',
#     phone_number: '3333-4444',
#     prod_name: 'Como importar da China',
#     status: 'approved',
#     user_id: User.first.id,
#     customer_email: 'test@test.com'
#   },
#   {
#     hotmart_transaction: 'HIJ',
#     phone_local_code: '31',
#     phone_number: '3333-4444',
#     prod_name: 'Como importar da China',
#     status: 'canceled',
#     user_id: User.first.id,
#     customer_email: 'test@test.com'
#   },
#   {
#     hotmart_transaction: 'KLM',
#     phone_local_code: '31',
#     phone_number: '3333-4444',
#     prod_name: 'Como importar da China',
#     status: 'chargeback',
#     user_id: User.first.id,
#     customer_email: 'test@test.com'
#   }
#   ])
# puts "Finalizando criação de usuários para testes!!!!!"

DataType.create!([
    { name: 'string',
      description: 'string' },
    { name: 'boolean',
      description: 'boolean' },
    { name: 'date',
      description: 'date' }
  ])

string_id = DataType.find_by_name('string').id
boolean_id = DataType.find_by_name('boolean').id
date_id = DataType.find_by_name('date').id

puts "Iniciando criação dos parâmetros Hotmart"

HotmartParam.create!([
              { name: 'hottok',
                description: 'Um token único, gerado pelo Hotmart para você produtor. Cada conta possui o seu próprio token, e esta é a garantia que o post está sendo feito pelo Hotmart. Para ver qual é seu token, acesse o hotmart e vá em "Minha Conta -> Configurações Avançadas e API".',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'prod',
                description: 'Identificador do Produto que foi adquirido.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'prod_name',
                description: 'Nome do Produto que foi adquirido.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'off',
                description: 'Identificador da Oferta que foi adquirida.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'price',
                description: 'Preço da Oferta no momento da compra.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'aff',
                description: 'Código de afiliado do usuário que indicou a venda do produto.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'aff_name',
                description: 'Nome do usuário que indicou a venda do produto.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'email',
                description: 'Email do comprador.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'name',
                description: 'Nome do comprador.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'first_name',
                description: 'Primeiro nome do comprador.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'last_name',
                description: 'Sobrenome do comprador.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'doc',
                description: 'CPF da pessoa ou documento usado na compra. Ex: 99999999999',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'phone_local_code',
                description: 'DDD do telefone. Ex: 99',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'phone_number',
                description: 'Número do telefone. Ex: 99999999',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'address',
                description: 'Logradouro.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'address_number',
                description: 'Número do endereço.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'address_country',
                description: 'País do comprador.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'address_district',
                description: 'Bairro.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'address_comp',
                description: 'Complemento do endereço.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'address_city',
                description: 'Cidade.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'address_state',
                description: 'Estado. Ex: SP, MG.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'address_zip_code',
                description: 'CEP ou Zip Code. Ex: 99999999',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'transaction',
                description: 'Identificador da transação.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'xcod',
                description: 'Identificador customizado pelo usuário, pode ser definido no link de venda para ser recebido de volta (ex: http://hotmart.net.br/show.html?a=555&xcod=meu_codigo_de_controle.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'src',
                description: 'Src (origem) é um código de até 6 caracteres que pode ser customizado pelo usuário para rastrear origens das vendas realizadas (ex: fb, blog, adwrd).',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'status',
                description: 'Status da compra (started, approved, canceled, pending_analysis, billet_printed, refunded, completed, blocked, chargeback).',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'payment_engine',
                description: 'Envia quem processou a compra (moip ou paypal).',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'payment_type',
                description: 'Informa como o comprador pagou (credit_card, billet, bank_transfer, bcash_balance, paypal).',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'hotkey',
                description: 'Enviado apenas no caso de Sites de Membros (venda de Acesso à conteúdo restrito). Trata-se do serial único liberado para aquele comprador.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'name_subscription_plan',
                description: 'Enviado apenas em caso de venda de assinaturas. Trata-se do nome do plano adquirido.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'subscriber_code',
                description: 'Enviado apenas em caso de venda de assinaturas. Trata-se do código do assinante.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'cms_marketplace',
                description: 'Tarifa de intermediação e processamento do pagamento.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'cms_vendor',
                description: 'Comissão do produtor gerada nesta transação.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'cms_aff',
                description: 'Comissão do afiliado gerada nesta transação.',
                data_type_id: string_id,
                show_in_activation_rule: false }, 
              { name: 'callback_type',
                description: 'Tipo do Callback: 1-compra pagamento unico, 2 - cancelamento assinatura.',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'subscription_status',
                description: 'Status da assinatura (active/canceled/past_due/expired).',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'transaction_ext',
                description: 'Código de transação gerado pelo meio de pagamento externo (BCash, Paypal, etc).',
                data_type_id: string_id,
                show_in_activation_rule: true }, 
              { name: 'sck',
                description: 'sck (origem do checkout) é um código de até 6 caracteres que pode ser customizado pelo usuário para rastrear origens das vendas realizadas em seus checkouts (ex: fb, blog, adwrd).',
                data_type_id: string_id,
                show_in_activation_rule: true },
              { name: 'purchase_date_start',
                description: 'Data do pedido (início)',
                data_type_id: date_id,
                show_in_activation_rule: true },
              { name: 'purchase_date_end',
                description: 'Data do pedido (fim)',
                data_type_id: date_id,
                show_in_activation_rule: true }
              ])

HotmartParam.
  find_by_name('address_state').
    accepted_values.create!([
              { value: 'AC' },
              { value: 'AL' },
              { value: 'AP' },
              { value: 'AM' },
              { value: 'BA' },
              { value: 'CE' },
              { value: 'DF' },
              { value: 'ES' },
              { value: 'GO' },
              { value: 'MA' },
              { value: 'MT' },
              { value: 'MS' },
              { value: 'MG' },
              { value: 'PA' },
              { value: 'PB' },
              { value: 'PR' },
              { value: 'PE' },
              { value: 'PI' },
              { value: 'RJ' },
              { value: 'RN' },
              { value: 'RS' },
              { value: 'RO' },
              { value: 'RR' },
              { value: 'SC' },
              { value: 'SP' },
              { value: 'SE' },
              { value: 'TO' }
      ])

HotmartParam.
  find_by_name('status').
    accepted_values.create!([
              { value: 'started' },
              { value: 'approved' },
              { value: 'canceled' },
              { value: 'pending_analysis' },
              { value: 'billet_printed' },
              { value: 'refunded' },
              { value: 'completed' },
              { value: 'blocked' },
              { value: 'chargeback' }
              ])

HotmartParam.
  find_by_name('payment_engine').
    accepted_values.create!([
              { value: 'moip' },
              { value: 'paypal' }
              ])

HotmartParam.
  find_by_name('payment_type').
    accepted_values.create!([
              { value: 'credit_card' },
              { value: 'billet' },
              { value: 'bank_transfer' },
              { value: 'bcash_balance' },
              { value: 'paypal' }
              ])

HotmartParam.
  find_by_name('callback_type').
    accepted_values.create!([
              { value: '1' },
              { value: '2' }
              ])

HotmartParam.
  find_by_name('subscription_status').
    accepted_values.create!([
              { value: 'active' },
              { value: 'canceled' },
              { value: 'past_due' },
              { value: 'expired' }
              ])

puts "Iniciando criação dos parâmetros Mailchimp"

MailchimpParam.create!([
  { name: 'list_id',
    description: 'The list id where a user will be subscribed/unsubscribed to/from',
    data_type_id: string_id },
  { name: 'email',
    description: 'The email address to be subscribed/unsubscribed to/from a list.',
    data_type_id: string_id },
  { name: 'group_name',
    description: 'The group name to classify a user',
    data_type_id: string_id },
  { name: 'email_type',
    description: 'Optional email type preference for the email (html or text - defaults to html)',
    data_type_id: string_id },
  { name: 'double_optin',
    description: 'Optional flag to control whether a double opt-in confirmation message is sent, defaults to true. Abusing this may cause your Mailchimp account to be suspended.',
    data_type_id: boolean_id },
  { name: 'update_existing',
    description: 'Optional flag to control whether existing subscribers should be updated instead of throwing an error, defaults to false.',
    data_type_id: boolean_id },
  { name: 'replace_interests',
    description: "Optional flag to determine whether we replace the interest groups with the groups provided or we add the provided groups to the member's interest groups (optional, defaults to true)",
    data_type_id: boolean_id },
  { name: 'send_welcome',
    description: "Optional if your double_optin is false and this is true, we will send your lists Welcome Email if this subscribe succeeds - this will *not* fire if we end up updating an existing subs-criber. If double_optin is true, this has no effect. defaults to false.",
    data_type_id: boolean_id },
  { name: 'delete_member',
    description: "Optional flag to completely delete the member from your list instead of just unsubscribing, default to false",
    data_type_id: boolean_id },
  { name: 'send_goodbye',
    description: "Optional flag to send the goodbye email to the email address, defaults to true",
    data_type_id: boolean_id },
  { name: 'send_notify',
    description: "Optional flag to send the unsubscribe notification email to the address defined in the list email notification settings, defaults to true",
    data_type_id: boolean_id }
  ])

MailchimpParam.
  find_by_name('email_type').
  accepted_values.create!([
    { value: 'html' },
    { value: 'text' }
    ])

puts "Iniciando o cadastro dos métodos das APIs Mailchimp e Helpscout"
MailchimpApiMethod.create!([
    { name: 'subscribe',
      description: 'Subscribe the provided email to a list. By default this sends a confirmation email - you will not see new members until the link contained in it is clicked!' },
    { name: 'update-member', 
      description: 'Edit the email address, merge fields, and interest groups for a list member' },
    { name: 'unsubscribe',
      description: 'Unsubscribe the given email address from the list' }
  ])

puts "Cadastrando os argumentos dos métodos das APIs"
MailchimpApiMethod.
  find_by_name('unsubscribe').
  arguments.create!([
    { api_param_id: MailchimpParam.find_by_name('list_id').id,
      position: 1,
      required: true },
    { api_param_id: MailchimpParam.find_by_name('email').id,
      position: 2,
      required: true },
    { api_param_id: MailchimpParam.find_by_name('delete_member').id,
      position: 3,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('send_goodbye').id,
      position: 4,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('send_notify').id,
      position: 5,
      required: false }
    ])
    
MailchimpApiMethod.
  find_by_name('subscribe').
  arguments.create!([
    { api_param_id: MailchimpParam.find_by_name('list_id').id,
      position: 1,
      required: true },
    { api_param_id: MailchimpParam.find_by_name('email').id,
      position: 2,
      required: true },
    { api_param_id: MailchimpParam.find_by_name('group_name').id,
      position: 3,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('email_type').id,
      position: 4,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('double_optin').id,
      position: 5,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('update_existing').id,
      position: 6,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('replace_interests').id,
      position: 7,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('send_welcome').id,
      position: 8,
      required: false }
    ])

MailchimpApiMethod.
  find_by_name('update-member').
  arguments.create!([
    { api_param_id: MailchimpParam.find_by_name('list_id').id,
      position: 1,
      required: true },
    { api_param_id: MailchimpParam.find_by_name('email').id,
      position: 2,
      required: true },
    { api_param_id: MailchimpParam.find_by_name('group_name').id,
      position: 3,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('email_type').id,
      position: 4,
      required: false },
    { api_param_id: MailchimpParam.find_by_name('replace_interests').id,
      position: 7,
      required: false }
    ])