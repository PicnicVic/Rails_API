# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
<<<<<<< HEAD
    origins "http://localhost:3001"
=======
    origins "http://localhost:3001", "http://localhost:3002", "https://picnic-vic.netlify.app"
    # origins "http://localhost:3002"
>>>>>>> b6b107949123c565217097f247ec8a786e1ae048
    # origins "*"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
