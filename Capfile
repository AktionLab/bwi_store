load 'deploy' if respond_to?(:namespace) # cap2 differentiator


Dir['lib/recipes/*.rb', 'vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'deploy/assets'
load 'config/deploy' # remove this line to skip loading any of the default tasks

