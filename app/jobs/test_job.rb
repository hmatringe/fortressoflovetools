class TestJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    puts "I'm starting with user with the id #{user_id}"
    sleep 2
    puts "done"
  end
end
