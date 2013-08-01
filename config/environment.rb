# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Invinyx::Application.initialize!

ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural 'familia', 'familias'
end