require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  generator :avatarly do |content, *args|
    img = Avatarly.generate_avatar(args[0], args[1])
    content.update(img)
  end

  secret "caa7f6c5e455ed91bb38584de9369fd5a0e0cef6896e48a5601a121a20d4dca7"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
