class NYStateFairConcerts::ConcertScraper

  def get_page
    Nokogiri::HTML(open("https://nysfair.ny.gov/venue/chevy-court/"))
  end

  def scrape_index_page
    self.get_page.css("tr.event-list-feed-item")
  end

  def make_concerts
    self.scrape_index_page.collect do |concert|
      NYStateFairConcerts::Concert.new_from_index_page(concert)
    end
  end

  def get_summary(concert)
    Nokogiri::HTML(open(concert.url))
  end

  def scrape_summary(concert)
    self.get_summary(concert).css('div.entry-content p').first.text
  end

end
