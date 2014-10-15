SCRIPT DE INTEGRAÇÃO HOTMART, MAILCHIMP E HELPSCOUT
===================================================

Este é o script para integração entre o Hotmart, MailChimp e HelpScout.

* Ruby
    * 2.1.2
* Rails
    * 4.1.4
* Testes
    * rspec spec
* Code Smell
    * rails_best_practices -f html .
      * Gera /rails_best_practices_output.html
    * rspec spec
      * Gera /coverage/index.html
* Inicializando Banco de Dados (ambientes de teste e desenvolvimento)
    * rake db:create
    * rake db:migrate
    * rake db:seed
* Gerando diagramas de classes UML
    * rake diagram:all
      * Gera arquivos svg em /doc/
* Configuration
* Database creation
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
