namespace :user do
  desc "Example: Enriching all users with Clearbit (async)"
  task :update_all => :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      TestJob.perform_later(user.id)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end

  desc "Example: Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
      TestJob.perform_now(user.id)
    # rake task will return when job is _done_
  end

end
