module Contestable
  extend ActiveSupport::Concern

  def calculate_popularity
    self.popularity = self.likes.count + (self.email_signups.count * 2)
    self.save
  end

  module ClassMethods
    def by_likes
      self.left_joins(:likes)
          .group(:id).select('posts.*', 'COUNT(likes.id) like_count')
          .order(like_count: :desc)
    end

    def by_popularity
      self.order(popularity: :desc)
    end

    def reap_the_uncools
      self.where('created_at < ?', DateTime.now - 30.days)
          .update_all(popularity: 0)
    end
  end
end
