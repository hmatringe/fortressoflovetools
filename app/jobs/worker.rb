# require 'sidekiq'

# Sidekiq.configure_client do |config|
#   config.redis = { db: 1 }
# end

# Sidekiq.configure_server do |config|
#   config.redis = { db: 1 }
# end

class OurWorker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when "super"
      sleep 7
      puts "super hard!"
    when "very"
      sleep 3
      puts "very hard!"
    else
      sleep 3
      puts "easy peasy hard!"
    end
  end
end
