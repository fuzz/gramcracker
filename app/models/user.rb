class User < ApplicationRecord
  paginates_per 100

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :email_signups, through: :posts
  has_many :likes, through: :posts
end
