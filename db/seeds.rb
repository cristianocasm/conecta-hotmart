puts "Starting db seed"

UserType.create([
  { name: 'admin',
    description: 'Admin'},
  { name: 'client',
    description: 'Client'}
  ])

User.create!({
    name: 'Admin',
    password: '12345678',
    password_confirmation: '12345678',
    email: 'cristiano.souza.mendonca@gmail.com',
    user_type_id: UserType.find_by_name('admin').id
    })

DataType.create!([
    { name: 'string',
      description: 'string' },
    { name: 'boolean',
      description: 'boolean' }
  ])

string_id = DataType.find_by_name('string').id

HotmartParam.create!([
              { name: 'hottok',
                description: 'Um token único, gerado pelo Hotmart para você produtor. Cada conta possui o seu próprio token, e esta é a garantia que o post está sendo feito pelo Hotmart. Para ver qual é seu token, acesse o hotmart e vá em "Minha Conta -> Configurações Avançadas e API".',
                data_type_id: string_id}, 
              { name: 'prod',
                description: 'Identificador do Produto que foi adquirido.',
                data_type_id: string_id }, 
              { name: 'prod_name',
                description: 'Nome do Produto que foi adquirido.',
                data_type_id: string_id }, 
              { name: 'off',
                description: 'Identificador da Oferta que foi adquirida.',
                data_type_id: string_id }, 
              { name: 'price',
                description: 'Preço da Oferta no momento da compra.',
                data_type_id: string_id }, 
              { name: 'aff',
                description: 'Código de afiliado do usuário que indicou a venda do produto.',
                data_type_id: string_id }, 
              { name: 'aff_name',
                description: 'Nome do usuário que indicou a venda do produto.',
                data_type_id: string_id }, 
              { name: 'email',
                description: 'Email do comprador.',
                data_type_id: string_id }, 
              { name: 'name',
                description: 'Nome do comprador.',
                data_type_id: string_id }, 
              { name: 'first_name',
                description: 'Primeiro nome do comprador.',
                data_type_id: string_id }, 
              { name: 'last_name',
                description: 'Sobrenome do comprador.',
                data_type_id: string_id }, 
              { name: 'doc',
                description: 'CPF da pessoa ou documento usado na compra. Ex: 99999999999',
                data_type_id: string_id }, 
              { name: 'phone_local_code',
                description: 'DDD do telefone. Ex: 99',
                data_type_id: string_id }, 
              { name: 'phone_number',
                description: 'Número do telefone. Ex: 99999999',
                data_type_id: string_id }, 
              { name: 'address',
                description: 'Logradouro.',
                data_type_id: string_id }, 
              { name: 'address_number',
                description: 'Número do endereço.',
                data_type_id: string_id }, 
              { name: 'address_country',
                description: 'País do comprador.',
                data_type_id: string_id }, 
              { name: 'address_district',
                description: 'Bairro.',
                data_type_id: string_id }, 
              { name: 'address_comp',
                description: 'Complemento do endereço.',
                data_type_id: string_id }, 
              { name: 'address_city',
                description: 'Cidade.',
                data_type_id: string_id }, 
              { name: 'address_state',
                description: 'Estado. Ex: SP, MG.',
                data_type_id: string_id }, 
              { name: 'address_zip_code',
                description: 'CEP ou Zip Code. Ex: 99999999',
                data_type_id: string_id }, 
              { name: 'transaction',
                description: 'Identificador da transação.',
                data_type_id: string_id }, 
              { name: 'xcod',
                description: 'Identificador customizado pelo usuário, pode ser definido no link de venda para ser recebido de volta (ex: http://hotmart.net.br/show.html?a=555&xcod=meu_codigo_de_controle.',
                data_type_id: string_id }, 
              { name: 'src',
                description: 'Src (origem) é um código de até 6 caracteres que pode ser customizado pelo usuário para rastrear origens das vendas realizadas (ex: fb, blog, adwrd).',
                data_type_id: string_id }, 
              { name: 'status',
                description: 'Status da compra (started, approved, canceled, pending_analysis, billet_printed, refunded, completed, blocked, chargeback).',
                data_type_id: string_id }, 
              { name: 'payment_engine',
                description: 'Envia quem processou a compra (moip ou paypal).',
                data_type_id: string_id }, 
              { name: 'payment_type',
                description: 'Informa como o comprador pagou (credit_card, billet, bank_transfer, bcash_balance, paypal).',
                data_type_id: string_id }, 
              { name: 'hotkey',
                description: 'Enviado apenas no caso de Sites de Membros (venda de Acesso à conteúdo restrito). Trata-se do serial único liberado para aquele comprador.',
                data_type_id: string_id }, 
              { name: 'name_subscription_plan',
                description: 'Enviado apenas em caso de venda de assinaturas. Trata-se do nome do plano adquirido.',
                data_type_id: string_id }, 
              { name: 'subscriber_code',
                description: 'Enviado apenas em caso de venda de assinaturas. Trata-se do código do assinante.',
                data_type_id: string_id }, 
              { name: 'cms_marketplace',
                description: 'Tarifa de intermediação e processamento do pagamento.',
                data_type_id: string_id }, 
              { name: 'cms_vendor',
                description: 'Comissão do produtor gerada nesta transação.',
                data_type_id: string_id }, 
              { name: 'cms_aff',
                description: 'Comissão do afiliado gerada nesta transação.',
                data_type_id: string_id }, 
              { name: 'callback_type',
                description: 'Tipo do Callback: 1-compra pagamento unico, 2 - cancelamento assinatura.',
                data_type_id: string_id }, 
              { name: 'subscription_status',
                description: 'Status da assinatura (active/canceled/past_due/expired).',
                data_type_id: string_id }, 
              { name: 'transaction_ext',
                description: 'Código de transação gerado pelo meio de pagamento externo (BCash, Paypal, etc).',
                data_type_id: string_id }, 
              { name: 'sck',
                description: 'sck (origem do checkout) é um código de até 6 caracteres que pode ser customizado pelo usuário para rastrear origens das vendas realizadas em seus checkouts (ex: fb, blog, adwrd).',
                data_type_id: string_id }
              ])

HotmartParam.
  find_by_name('address_state').
    accepted_values.create!([
              { name: 'AC',
                description: 'Acre' },
              { name: 'AL',
                description: 'Alagoas' },
              { name: 'AP',
                description: 'Amapá' },
              { name: 'AM',
                description: 'Amazonas' },
              { name: 'BA',
                description: 'Bahia' },
              { name: 'CE',
                description: 'Ceará' },
              { name: 'DF',
                description: 'Distrito Federal' },
              { name: 'ES',
                description: 'Espírito Santo' },
              { name: 'GO',
                description: 'Goiás' },
              { name: 'MA',
                description: 'Maranhão' },
              { name: 'MT',
                description: 'Mato Grosso' },
              { name: 'MS',
                description: 'Mato Grosso do Sul' },
              { name: 'MG',
                description: 'Minas Gerais' },
              { name: 'PA',
                description: 'Pará' },
              { name: 'PB',
                description: 'Paraíba' },
              { name: 'PR',
                description: 'Paraná' },
              { name: 'PE',
                description: 'Pernambuco' },
              { name: 'PI',
                description: 'Piauí' },
              { name: 'RJ',
                description: 'Rio de Janeiro' },
              { name: 'RN',
                description: 'Rio Grande do Norte' },
              { name: 'RS',
                description: 'Rio Grande do Sul' },
              { name: 'RO',
                description: 'Rondônia' },
              { name: 'RR',
                description: 'Roraima' },
              { name: 'SC',
                description: 'Santa Catarina' },
              { name: 'SP',
                description: 'São Paulo' },
              { name: 'SE',
                description: 'Sergipe' },
              { name: 'TO',
                description: 'Tocantins' }
      ])

HotmartParam.
  find_by_name('status').
    accepted_values.create!([
              { name: 'started',
                description: 'started' },
              { name: 'approved',
                description: 'approved' },
              { name: 'canceled',
                description: 'canceled'},
              { name: 'pending_analysis',
                description: 'pending_analysis'},
              { name: 'billet_printed',
                description: 'billet_printed'},
              { name: 'refunded',
                description: 'refunded'},
              { name: 'completed',
                description: 'completed'},
              { name: 'blocked',
                description: 'blocked'},
              { name: 'chargeback',
                description: 'chargeback'}
              ])

HotmartParam.
  find_by_name('payment_engine').
    accepted_values.create!([
              { name: 'moip',
                description: 'moip' },
              { name: 'paypal',
                description: 'paypal' }
              ])

HotmartParam.
  find_by_name('payment_type').
    accepted_values.create!([
              { name: 'credit_card',
                description: 'credit_card' },
              { name: 'billet',
                description: 'billet' },
              { name: 'bank_transfer',
                description: 'bank_transfer' },
              { name: 'bcash_balance',
                description: 'bcash_balance' },
              { name: 'paypal',
                description: 'paypal' }
              ])

HotmartParam.
  find_by_name('callback_type').
    accepted_values.create!([
              { name: '1',
                description: '1-compra pagamento unico' },
              { name: '2',
                description: '2 - cancelamento assinatura' }
              ])

HotmartParam.
  find_by_name('subscription_status').
    accepted_values.create!([
              { name: 'active',
                description: 'active' },
              { name: 'canceled',
                description: 'canceled' },
              { name: 'past_due',
                description: 'past_due' },
              { name: 'expired',
                description: 'expired' }
              ])