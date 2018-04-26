require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#use RACK::METHODOVERRIDE
use Rack::MethodOverride

run ApplicationController
