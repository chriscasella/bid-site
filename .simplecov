require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
   add_filter 'app/channels/application_cable'
   add_filter 'app/jobs'
   add_filter 'config/initializers'
end
