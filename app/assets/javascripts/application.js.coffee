# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require bootstrap-sprockets
#= require bootstrap-tour
#= require dataTables/jquery.dataTables
#= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
#= require turbolinks
#= require_tree .

jQuery ->
  $('#data_table').dataTable()
  $('a').tooltip()

  $('#tour').click ->
    tour = create_tour()
    tour.init()
    tour.start(true)

create_tour = () ->
  new Tour(
      steps: [
        {
          element: "#tour",
          title: "Seja bem vindo ao tutorial do Conecta Hotmart!",
          content: "Para continuar pressione o botão 'Next' :D",
          placement: "bottom",
          backdrop: true
        },
        {
          element: "#sidebar",
          title: "Menu",
          content: "Este é o menu do Conecta Hotmart. Aqui estão todas as \
          funcionalidades necessárias à (1) Integração, (2) Configuração e \
          (3) Supervisão do sistema. Pressione 'Next' para saber como \
          funciona cada uma dessas três etapas.",
          placement: "right",
          backdrop: true
        },
        {
          element: "#integracao",
          title: "(1) Integração",
          content: "Para que o Conecta Hotmart seja capaz de se comunicar \
          com o Hotmart, o Mailchimp e/ou o Helpscout é necessário que \
          uma integração seja realizada com cada um desses sistema. Esta é a área \
          onde você será capaz de realizar essas integrações. Clique em 'Next' \
          e saiba mais.",
          placement: "right",
          backdrop: true
        },
        {
          element: "#dashboard",
          title: "(1) Integração",
          content: "Esta é a área onde você encontrará todo o necessário \
          à integração do Conecta Hotmart. Note que uma aba foi criada \
          para cada sistema. Portanto, quando estiver realizando a \
          integração, certifique-se de que está na área correta. Clique \
          em 'Next' para saber como realizar a integração com o Hotmart.",
          placement: "bottom",
          backdrop: false
        },
        {
          element: "#hotmart_callback",
          title: "(1) Integração - Hotmart (1º passo)",
          content: "A integração com o Hotmart é feita em dois passos.

          1º passo: Copie este link, acesse sua conta no Hotmart e, \
          dentro de 'MINHA CONTA > Configurações Avançadas e API', cole-o \
          no campo 'URLs de notificação'. Ainda no Hotmart, não se \
          esqueça de clicar em 'Gravar' para salvar a configuração. Clique \
          em 'Next' para realizar o segundo passo da integração.",
          placement: "right",
          backdrop: true
        },
        {
          element: "#key",
          title: "(1) Integração - Hotmart (2º passo)",
          content: "2º passo: Ainda dentro do Hotmart ('MINHA CONTA > Configurações \
          Avançadas e API') copie a sequência de caracteres e letras presente na área \
          'Token:' e cole-a aqui. Não se esqueça de clicar no botão 'Update' para \
          salvar a configuração.",
          placement: "right",
          backdrop: true,
          path: $("#hotmart_api_key_area").attr('href')
        },
        {
          element: "#key",
          title: "(1) Integração - Mailchimp",
          content: "Para realizar a integração com o Mailchimp, acesse sua conta \
          no Mailchimp, navegue até 'Account > Extras > API keys', copie sua \
          chave (key) e cole-a neste campo. Não se esqueça de clicar em 'Update' \
          para salvar suas alterações.",
          placement: "right",
          backdrop: true,
          path: $("#mailchimp_api_key_area").attr('href')
        },
        {
          element: "#helpscout_callback",
          title: "(1) Integração - Helpscout (1º passo)",
          content: "Assim como a integração com o Hotmart, a com o Helpscout \
          também é feita em dois passos.

          1º passo: Acesse sua conta no Helpscout e navegue até 'Apps > Build \
          a Custom App > Create App'. Em 'Content Type' escolha a opção 'Dynamic \
          Content'. Em 'Callback URL' cole link ao lado. Em 'Secret Key' crie uma \
          sequência de números e letras. Em 'Debug Mode' escolha a opção 'OFF'. \
          Em 'Mailboxes' escolha as caixas de entrada para as quais deseja \
          que o App seja ativado.",
          placement: "right",
          backdrop: true,
          path: $("#helpscout_api_key_area").attr('href')
        },
        {
          element: "#key",
          title: "(1) Integração - Helpscout (2º passo)",
          content: "Copie a sequência de caracteres e letras inseridas no campo \
          'Secret Key' e cole aqui. Não se esqueça de clicar em 'Update' para \
          salvar as informações.",
          placement: "right",
          backdrop: true
        },
        {
          element: "#dashboard",
          title: "Fim da Integração",
          content: "Com estes passos finalizamos a parte referente à (1) Integração \
          do Conecta Hotmart. Nos próximos passos você aprenderá como (2) Configurar \
          e (3) Supervisionar o sistema.",
          placement: "bottom",
          backdrop: false
        },
        {
          element: "#regras_hotmart",
          title: "(2) Configuração - Regras Hotmart",
          content: "Toda vez que uma atualização ocorre em alguma transação do Hotmart \
          uma notificação é enviada para o Conecta avisando sobre a alteração. As \
          informações presentes nessas notificações podem ser utilizadas para que, por \
          exemplo, o e-mail do comprador seja cadastrado/retirado de uma lista no \
          Mailchimp. Clique 'Next' para continuar.",
          placement: "right",
          backdrop: true,
          path: $("#regras_hotmart_link").attr('href')
        },
        {
          element: "#dashboard",
          title: "(2) Configuração - Listagem de Regras Hotmart",
          content: "Nesta área são listadas todas as Regras Hotmart criadas por você.",
          placement: "bottom",
          backdrop: true
        },
        {
          element: "#botao_novo",
          title: "(2) Configuração - Criando uma nova Regra Hotmart",
          content: "Para criar uma nova Regra Hotmart basta clicar neste botão. Clique \
          em 'Next' para continuar.",
          placement: "right",
          backdrop: true
        },
        {
          element: "#dashboard",
          title: "(2) Configuração - Criando um nova Regra Hotmart",
          content: "Nesta página você poderá criar uma nova Regra Hotmart. Caso uma \
          notificação contenha os valores definidos por você (exceto os campos 'Name' \
          e 'Description'), então Regras Mailchimp serão executadas. Para saber mais \
          a respeito de cada campo, passe o mouse sobre o '?' presente ao lado de cada \
          campo. ATENÇÃO: campos deixados vazios não serão considerados.",
          placement: "left",
          backdrop: true,
          path: $("#botao_novo").attr('href')
        },
        {
          element: "#regras_mailchimp",
          title: "(2) Configuração - Regras Mailchimp",
          content: "As Regras Mailchimp funcionam para automatizar o cadastro, remoção e \
          atualização de e-mails em listas do Mailchimp. Uma Regra Mailchimp é executada \
          quando o Hotmart envia uma notificação ao Conecta com os parâmetros definidos \
          em uma Regra Hotmart.",
          placement: "right",
          backdrop: true,
          path: $("#regras_mailchimp_link").attr('href')
        },
        {
          element: "#dashboard",
          title: "(2) Configuração - Listagem de Regras Mailchimp",
          content: "Nesta área são listadas todas as Regras Mailchimp criadas por você.",
          placement: "bottom",
          backdrop: true
        },
        {
          element: "#botao_novo",
          title: "(2) Configuração - Criando uma nova Regra Mailchimp",
          content: "Para criar uma nova Regra Mailchimp basta clicar neste botão. Clique \
          em 'Next' para continuar.",
          placement: "right",
          backdrop: true
        },
        {
          element: "#dashboard",
          title: "(2) Configuração - Criando um nova Regra Mailchimp",
          content: "Para criar uma Regra Mailchimp é necessário escolher qual método \
          será utilizado. O método 'subscribe' insere um e-mail em uma lista. O método \
          'update-member' atualiza um membro de uma lista. Já o método 'unsubscribe' \
          remove um e-mail de uma lista.",
          placement: "bottom",
          backdrop: true,
          path: $("#botao_novo").attr('href')
        },
        {
          element: "#dashboard",
          title: "(2) Configuração - Criando um nova Regra Mailchimp",
          content: "Esta é a página para a criação de uma Regra Mailchimp que irá \
          inserir o e-mail do comprador (recebido através de uma notificação do Hotmart) \
          em uma lista do Mailchimp.",
          placement: "left",
          backdrop: true,
          path: $("#subscribe").attr('href')
        },
        {
          element: "#assoc_regras",
          title: "(2) Associação de Regras",
          content: "Como último passo para configurar o Conecta Hotmart, você deverá \
          associar Regras Hotmart a Regras Mailchimp. Dessa forma, sempre que uma \
          notificação do Hotmart estiver de acordo com uma Regra Hotmart, então uma \
          ou mais Regras Mailchimp serão executadas.",
          placement: "right",
          backdrop: true,
          path: $("#assoc_regras_link").attr('href')
        },
        {
          element: "#dashboard",
          title: "(2) Associação de Regras",
          content: "Nesta área são listadas todas as Associações criadas por você.",
          placement: "bottom",
          backdrop: true
        },
        {
          element: "#botao_novo",
          title: "(2) Associação de Regras",
          content: "Quando houverem Regras Hotmart e Regras Mailchimp criadas, basta \
          clicar neste botão para efetuar a associação.",
          placement: "right",
          backdrop: true
        },
        {
          element: "#logs",
          title: "(3) Supervisão",
          content: "Uma vez efetuadas a (1) Integração e (2) Configuração do Conecta \
          Hotmart, basta supervisionar o sistema para se certificar de que tudo está \
          ocorrendo conforme desejado. Esta área apresenta os logs do sistema. Ou seja, \
          as notificações recebidas do Hotmart, as Regras Hotmart e Regras Mailchimp \
          ativadas. Clique 'Next' para conhecer mais.",
          placement: "right",
          backdrop: true,
          path: $("#logs_link").attr('href')
        },
        {
          element: "#dashboard",
          title: "(3) Supervisão",
          content: "Nesta área são listadas todas as Notificações recebidas do Hotmart, \
          bem como as regras Hotmart e Regras Mailchimp ativadas. É recomendado que você \
          acesse essa área pelo menos uma vez ao dia para verificar se tudo está ocorrendo \
          conforme desejado.",
          placement: "bottom",
          backdrop: true
        }
      ])