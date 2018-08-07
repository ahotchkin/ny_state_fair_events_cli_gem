class NYStateFairConcerts::ConcertScraper

  def get_page
    Nokogiri::HTML(open("https://nysfair.ny.gov/venue/chevy-court/"))
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

  def self.details(concert)
    @details ||= Nokogiri::HTML(open(concert.url))
  end

  def self.summary(concert)
    # Need to use if statement because Smokey Robinson's page is the only one without a <p> tag
    if concert.url == "https://nysfair.ny.gov/event/smokey-robinson/"
      @summary ||= self.details(concert).css("div.entry-content").first.text.match(/^.*Some.*$/).to_s
    else
      @summary ||= self.details(concert).css("div.entry-content p").first.text
    end
  end

end
