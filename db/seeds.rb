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
                show_in_activation_rule: false }, 
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
    description: 'O id da lista na qual o cliente será inserido/removido.',
    data_type_id: string_id },
  { name: 'email',
    description: 'O endereço de e-mail a ser inserido/removido na/da lista.',
    data_type_id: string_id },
  { name: 'group_name',
    description: 'O nome do groupo que classifica o cliente.',
    data_type_id: string_id },
  { name: 'email_type',
    description: 'Opcional - Tipo de e-mail a ser enviado (html ou text - caso não seja informado, será definido como html)',
    data_type_id: string_id },
  { name: 'double_optin',
    description: 'Opcional - Define se double opt-in será utilizado. Caso não seja informado, será definido como true. Abusar deste recurso pode fazer com que sua conta do Mailchimp seja suspensa.',
    data_type_id: boolean_id },
  { name: 'update_existing',
    description: 'Opcional - Define se clientes já inscritos devem ser atualizados ao invés de retornar erro. Valor padrão: false.',
    data_type_id: boolean_id },
  { name: 'replace_interests',
    description: "Opcional - Define se os 'interest groups' serão substituídos pelos novos fornecidos ou se os novos fornecidos serão adicionados aos 'interest groups' do membro. Valor padrão: true.",
    data_type_id: boolean_id },
  { name: 'send_welcome',
    description: "Opcional - Se o campo 'Double Optin' for 'false' e este for 'true', o Mailchimp irá eviar o email de boas vindas da lista se o cliente for inscrito com sucesso - isso *não* será disparado se um cliente já existente for atualizado. Se o campo 'Double Optin' for true, isso não tem efeito. Valor padrão: false.",
    data_type_id: boolean_id },
  { name: 'delete_member',
    description: "Opcional - Define se o cliente será completamente excluído da sua lista ao invés de apenas removê-lo. Valor padrão: false",
    data_type_id: boolean_id },
  { name: 'send_goodbye',
    description: "Opcional - Define se o email de despedida será enviado para o cliente. Valor padrão: true",
    data_type_id: boolean_id },
  { name: 'send_notify',
    description: "Opcional - Define se o e-mail notificando sobre uma remoção da lista será enviado para o endereço definido nas configurações de notificação de e-mail da lista. Valor padrão: true",
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