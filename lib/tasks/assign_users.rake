namespace :db do
  task :assign_users => :environment do
    puts 'assigning users...'

    Post.each do |post|
      post.post_username = post.user.username
      post.save!
    end
  end
end
