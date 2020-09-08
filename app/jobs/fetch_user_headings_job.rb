require 'headings_service'

class FetchUserHeadingsJob < ApplicationJob
  queue_as :default

  def perform(user_id, url)
    HeadingsService.new(url).fetch!.each do |heading|
      heading.gsub!("\n", "").strip! rescue nil
      Heading.create(user_id: user_id, content: heading)
    end
  end
end
