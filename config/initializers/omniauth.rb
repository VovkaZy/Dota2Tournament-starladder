# frozen_string_literal: true

module OmniAuth
  module Strategies
    autoload :Starladder, Rails.root.join('lib', 'omniauth', 'starladder')
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :starladder,
           ENV.fetch('STARLADDER_CLIENT_ID'),
           ENV.fetch('STARLADDER_CLIENT_SECRET')
  { callback_url: 'http://127.0.0.1:3000/auth/:provider/callback' }
end
