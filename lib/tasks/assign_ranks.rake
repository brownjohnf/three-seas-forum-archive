namespace :db do
  task :assign_ranks => :environment do
    puts 'assigning ranks...'

    User.where('rank_id = 0').each do |user|
      rank = Rank.where("min_posts <= #{user.posts.count} AND rank_special IS FALSE").order('min_posts ASC').last
      user.rank = rank
      user.save!
    end
  end
end
