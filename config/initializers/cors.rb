Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins  "localhost:5173", "localhost:5174"
    resource "*", headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end