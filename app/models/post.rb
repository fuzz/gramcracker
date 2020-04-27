class Post < ApplicationRecord
  include Contestable

  belongs_to :user
  has_one_attached :image
  has_many :email_signups
  has_many :likes

  paginates_per 60

  # Allow simple_form to use params[:post][:email] for email signups
  attr_accessor :email  
end
