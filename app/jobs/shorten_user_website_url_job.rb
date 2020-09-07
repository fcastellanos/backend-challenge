require 'short_url_service'

class ShortenUserWebsiteUrlJob < ApplicationJob
  queue_as :default

  def perform(user_id, url)
    user = User.find(user_id)
    user.short_url = ShortUrlService.shorten(url)['link']
    user.save
  end
end
