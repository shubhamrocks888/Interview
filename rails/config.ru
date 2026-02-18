config.ru in Rails
Full form

config.ru = Rack Configuration file

There is no long acronym for .ru —
it simply means Rack Up file (used by the rackup command).

What is Rack? (1-line)

Rack is the middleware interface between Ruby web apps (Rails) and web servers (Puma, Unicorn, Passenger, etc.)

Purpose of config.ru

config.ru tells a Rack-compatible web server:

👉 How to load and run your Rails application

Typical config.ru in a Rails app
# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server

Line-by-line explanation (interview friendly)
1️⃣ require_relative "config/environment"

Loads the entire Rails application

Reads:

application.rb

environment configs

initializers

Sets up database, middleware, routes, etc.

👉 Without this, Rails app doesn’t exist.

2️⃣ run Rails.application

run is a Rack DSL method

Tells Rack:

“This is the app that will handle HTTP requests”

Rails.application implements the Rack interface

call(env) → [status, headers, body]

3️⃣ Rails.application.load_server

Loads server-specific configurations

Needed for servers like Puma

Ensures correct hooks, signals, and threading behavior

How request flows (important for interviews)
Browser
  ↓
Web Server (Puma)
  ↓
Rack
  ↓
config.ru
  ↓
Rails.application
  ↓
Middleware
  ↓
Routes → Controller → Model → DB

Why Rails needs config.ru

Rails does not talk directly to web servers

Rack acts as a standard contract

Any Rack-compatible server can run Rails

Can we modify config.ru?

✅ Yes — to add middleware

Example:

use Rack::Attack
use Rack::Deflater

run Rails.application

When is config.ru used?

rails server

bundle exec puma

rackup

One-liner interview answer

config.ru is a Rack configuration file that tells a web server how to load and run a Rails application using the Rack interface.