# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
# run Rails.application

require "bundler/setup"
require "yaml"
require "faye"
require "render_sync"

Faye::WebSocket.load_adapter 'thin'

RenderSync.load_config(
  File.expand_path("../config/sync.yml", __FILE__),
  ENV["RAILS_ENV"] || "development"
)

run RenderSync.pubsub_app
