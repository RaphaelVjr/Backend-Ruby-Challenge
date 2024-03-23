require 'sidekiq'
require 'sidekiq-status'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }

  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }

  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
end