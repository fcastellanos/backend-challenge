require 'nokogiri'
require 'open-uri'

class HeadingsService
    attr_reader :document
    attr_reader :headings

    def initialize(url)
        begin
            @document = Nokogiri::HTML(URI.open(url))
        rescue Exception => e
            Rails.logger.error e.message
        end
        @headings = []
    end

    def fetch!
        return [] if @document.nil?

        ['h1', 'h2', 'h3', 'h4'].each do |heading|
            @document.css(heading).each do |element|
                @headings << element.text rescue ''
            end
        end

        @headings
    end
end
