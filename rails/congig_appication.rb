config/application.rb — what is its function?

config/application.rb defines and configures your Rails application class.
It is the central configuration file that is loaded before the app is initialized.

🎯 One-line interview answer

config/application.rb defines the Rails application, loads frameworks, and sets global configuration that applies to all environments.

📍 Where it sits in the boot process
bin/rails
  ↓
config/boot.rb        (Bundler, gems)
  ↓
config/application.rb ✅ (define app + configs)
  ↓
config/environment.rb (initialize!)

🧠 What actually happens inside config/application.rb
Typical file (simplified)
require_relative "boot"

require "rails/all"
# or selectively:
# require "active_model/railtie"
# require "active_record/railtie"

Bundler.require(*Rails.groups)

module MyApp
  class Application < Rails::Application
    config.load_defaults 7.1

    config.time_zone = "UTC"
    config.eager_load_paths << Rails.root.join("lib")
    config.autoload_paths << Rails.root.join("app/services")

    config.api_only = false
  end
end

🔍 Line-by-line purpose
1️⃣ require_relative "boot"

Loads config/boot.rb

Sets up Bundler and gems

2️⃣ require "rails/all" (or selective frameworks)

Loads Rails frameworks:

ActiveRecord

ActionController

ActionView

ActiveJob, etc.

👉 This decides what kind of app you are building

3️⃣ Bundler.require(*Rails.groups)

Loads gems from Gemfile

Based on environment (development, test, production)

4️⃣ class Application < Rails::Application

📍 Most important part

This:

Creates your application object

Inherits Rails boot logic

Becomes Rails.application

5️⃣ config.* settings

These are global app-level configs:

Examples:

config.time_zone

config.autoload_paths

config.middleware

config.active_job.queue_adapter

config.generators

👉 These apply to all environments

❗ What application.rb does NOT do

🚫 Does NOT:

Start the server

Handle requests

Load routes

Initialize DB connections

Those happen later

🧩 Relationship with other config files
File	Purpose
application.rb	Global app definition
environment.rb	Initializes app
development.rb	Env-specific overrides
initializers/*	One-time setup
config.ru	Rack entry point
🧠 Mental model (easy to remember)

application.rb = blueprint
environment.rb = power switch
config.ru = entry gate

🏁 Interview-ready summary

config/application.rb defines the Rails application class, loads required frameworks and gems, and sets global configuration that is shared across all environments before the application is initialized.