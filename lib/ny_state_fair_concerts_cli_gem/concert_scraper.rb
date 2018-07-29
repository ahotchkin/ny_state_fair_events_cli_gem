class NYStateFairConcerts::ConcertScraper

  def get_page
    Nokogiri::HTML(open('https://nysfair.ny.gov/venue/chevy-court/'))
  end

  def scrape_index_page
    self.get_page.css('tr.event-list-feed-item')
  end

  def make_concerts
    self.scrape_index_page.collect do |concert|
      NYStateFairConcerts::Concert.new_from_index_page(concert)
    end
  end




    # Concerts = document.css('tr.event-list-feed-item td.eventcol')
    # Band: concerts.css('td.eventcol')[i].text
    # Date: concerts.css('td.datecol')[i].text.gsub(/[\t\n]/, '')
    # Time: concerts.css('td.timecol')[i].text
    # Link: concerts.css('a').attribute('href').value


end
