#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
# be sure to change these
set :user, 'deployer'
set :domain, '67.23.3.35'
set :application, 'andy'

# file paths
set :repository,  "git@github.com:andrewpbrett/andybrett.com.git"
set :deploy_to, "/var/www/#{application}" 

# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true

ssh_options[:forward_agent] = true

# you might need to set this if you aren't seeing password prompts
default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'

# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false

after "deploy:update_code", "deploy:chown"

namespace :deploy do
  desc "Change owner"
  task :chown, :roles => :app do
    run "chown deployer:apps -R #{latest_release}"
  end
  desc "Restart appliction"  
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end

after "deploy" do 
  run "cp #{shared_path}/config/database.yml #{current_path}/config/database.yml"
  run "cp #{shared_path}/config/environment.rb #{current_path}/config/environment.rb"  
end