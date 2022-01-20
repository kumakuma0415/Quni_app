require 'clockwork'
# require './app/models/scraping'

module Clockwork
    every(5.seconds, 'kokoro') do
    puts "kokoro"
    # scraping1 = Scraping.new
    # scraping1.scrape
    end
end