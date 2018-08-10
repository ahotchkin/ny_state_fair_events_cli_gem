class NYStateFairConcerts::ConcertScraper

  def get_page
    Nokogiri::HTML(open("https://nysfair.ny.gov/venue/chevy-court/"))
  end

  def scrape_venue_summary
    self.get_page.css("div.clearfix p").first.text
  end

  def scrape_index_page
    self.get_page.css("tr.event-list-feed-item")
  end

  def make_concerts
    self.scrape_index_page.collect do |concert|
      NYStateFairConcerts::Concert.new(
        concert.css("td.eventcol").text,
        concert.css("td.datecol").text.gsub(/[\t\n]/, ""),
        concert.css("td.timecol").text,
        concert.css("a").attribute("href").value
      )
    end
  end


# Commented out for now because website has since changed and several bands don't have a summary on their page. Hoping this is updated and code will work again.

# Do these need to be class methods or should they be instance methods?

  # def self.details(concert)
  #   Nokogiri::HTML(open(concert.url))
  # end
  # 
  # def self.summary(concert)    
  #   # Need to use if statement because Smokey Robinson's page is the only one without a <p> tag
  #   if concert.url == "https://nysfair.ny.gov/event/smokey-robinson/"
  #     self.details(concert).css("div.entry-content").first.text.match(/^.*Some.*$/).to_s
  #   elsif concert.band.include?("parade")
  #     puts "Come to Chevy Court on #{concert.date} to see #{concert.band}."
  #   elsif concert.time.include?("am")
  #     puts "Come to Chevy Court on #{concert.date} to see #{concert.band}."
  #   else
  #     self.details(concert).css("div.entry-content p").first.text
  #   end
  # end

end
