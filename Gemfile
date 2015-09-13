source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise', '~> 3.5.2'
gem 'pundit', '~> 1.0.1'

gem "autoprefixer-rails"

gem 'simple_form'

# Use Puma as the app server
gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Rails generator which allows to scaffold admin controllers, views with proper (non-namespaced) models, helpers, tests and routes
# Create admin scaffold: bin/rails g admin:scaffold_controller Post title:string content:text
# Generate model: bin/rails g model Post title:string content:text
gem 'rails-admin-scaffold'

gem 'friendly_id', '~> 5.1.0'

# A fast, safe and extensible Markdown to (X)HTML parser
gem 'redcarpet', '~> 3.3.2'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Rails 3 and 4 https://github.com/amatsuda/kaminari/wiki
gem 'kaminari'

# Loads environment variables from `.env`
gem 'dotenv-rails'

# Dynamic nested forms using jQuery made easy https://github.com/nathanvda/cocoon
gem "cocoon"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development do
  gem 'pry-rails'

  # Mutes assets pipeline log messages https://github.com/evrone/quiet_assets
  gem 'quiet_assets'

  # Guard is a command line tool to easily handle events on file system modifications. http://guardgem.org
  gem 'guard'
  gem 'guard-livereload', '~> 2.4', require: false
end
