class NYStateFairConcerts::ConcertScraper

# What is the best way to have the the ConcertScraper class interact with the Concert class? Should one class inherit from other, or should one class require the other's file?
  require_relative './concerts'

  @@concerts = []
  def scrape_concerts
    document = Nokogiri::HTML(open('https://nysfair.ny.gov/venue/chevy-court/'))
    concerts = document.css('tr.event-list-feed-item td.eventcol')

    # Concerts = document.css('tr.event-list-feed-item td.eventcol')
    # Band: concerts.css('td.eventcol')[i].text
    # Date: concerts.css('td.datecol')[i].text.gsub(/[\t\n]/, '')
    # Time: concerts.css('td.timecol')[i].text
    # Link: links[i]
    # links = concerts.css('a').map { |link| link.attribute('href').value }
  end

  def make_concerts
    self.scrape_concerts.each do |concert|
      binding.pry
      concert = Concert.new
      concert.band = concert.css('td.eventcol').text
      concert.date = concert.css('td.datecol').text.gsub(/[\t\n]/, '')
      concert.time = concert.css('td.timecol').text
      concert.links = concert.css('a').map { |link| link.attribute('href').value }
      @@concerts << concert
    end
    @@concerts
  end

end
