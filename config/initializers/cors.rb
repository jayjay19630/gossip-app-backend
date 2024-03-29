Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:5173'
      resource '*', headers: :any, methods: [:get, :post, :delete, :put]
    end
    allow do
      origins 'https://nusgrapevine.netlify.app'
      resource '*', headers: :any, methods: [:get, :post, :delete, :put]
    end
  end