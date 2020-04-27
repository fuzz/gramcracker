class Post < ApplicationRecord
  paginates_per 60

  belongs_to :user
  has_one_attached :image
  has_many :email_signups
  has_many :likes

  # Allow simple_form to use params[:post][:email] for email signups
  attr_accessor :email

  def self.by_likes
    self.left_joins(:likes)
        .group(:id).select('posts.*', 'COUNT(likes.id) like_count')
        .order(like_count: :desc)
  end

  def self.by_popularity
    self.order(popularity: :desc)
  end

  def self.reap_the_uncools
    self.where('created_at < ?', DateTime.now - 30.days)
        .update_all(popularity: 0)
  end

  def calculate_popularity
    self.popularity = self.likes.count + (self.email_signups.count * 2)
    self.save
  end

end
