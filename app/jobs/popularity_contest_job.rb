class PopularityContestJob < ApplicationJob
  #repeat every: '1h'
  queue_as :default

  def perform(*args)
    posts = Post.by_likes
                .where('posts.created_at > ?', DateTime.now - 30.days)
                .limit(100)

    posts.each do |post|
      post.calculate_popularity
    end
  end
end
