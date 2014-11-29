require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, '104.131.77.228'
set :deploy_to, '/home/controle/'
set :repository, 'https://cristianocasm@bitbucket.org/hotappsplugins/conecta-hotmart.git'
set :branch, 'master'
set :rails_env, 'production'
# Permite inserção da senha no terminal quando solicitado
set :term_mode, nil

# For system-wide RVM install.
set :rvm_path, '/usr/local/rvm/bin/rvm'

# Optional settings:
set :user, 'controle' # Username in the server to SSH to.
set :port, '4444' # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use[ruby-2.1.3-p242@default]'
end

# Arquivos e pastas a serem compartilhadas entre as releases
set :shared_paths, ['config/database.yml', 'config/application.yml', 'log']
# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  # Cria pasta "log" dentro de /home/rails/shared
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  # Cria pasta "config" dentro de /home/rails/shared
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  # Cria arquivo "database.yml" dentro de /home/rails/shared/config
  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]

  # Cria arquivo "application.yml" dentro de /home/rails/shared/config
  queue! %[touch "#{deploy_to}/#{shared_path}/config/application.yml"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
      queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
      queue "sudo /etc/init.d/unicorn restart"
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

