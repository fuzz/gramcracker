class PopularityReaperJob < ApplicationJob
  #repeat 'every day at 2am'
  queue_as :default

  def perform(*args)
    Post.reap_the_uncools
  end
end
