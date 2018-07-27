class NYStateFairConcerts::ConcertScraper


  @@concerts = []
  def scrape_concerts
    concerts = Nokogiri::HTML(open('https://nysfair.ny.gov/venue/chevy-court/'))
    # concerts = document.css('tr.event-list-feed-item')
    concerts.css('tr.event-list-feed-item').each.with_index(1) do |concert, i|
      # binding.pry
      concert = Concert.new
      concert.band = concerts.css('td.eventcol')[i].text
      concert.date = concerts.css('td.datecol')[i].text.gsub(/[\t\n]/, '')
      concert.time = concerts.css('td.timecol')[i].text
      # concert.links = concerts.css('a').map { |link| link.attribute('href').value }
      @@concerts << concert
    end
    @@concerts

    # Concerts = document.css('tr.event-list-feed-item td.eventcol')
    # Band: concerts.css('td.eventcol')[i].text
    # Date: concerts.css('td.datecol')[i].text.gsub(/[\t\n]/, '')
    # Time: concerts.css('td.timecol')[i].text
    # Link: links[i]
    # links = concerts.css('a').map { |link| link.attribute('href').value }
  end

  # def self.make_concerts
  #   self.scrape_concerts.each do |concert|
  #     # binding.pry
  #     concert = self.new
  #     concert.band = concert.css('td.eventcol').text
  #     concert.date = concert.css('td.datecol').text.gsub(/[\t\n]/, '')
  #     concert.time = concert.css('td.timecol').text
  #     concert.links = concert.css('a').map { |link| link.attribute('href').value }
  #     @@concerts << concert
  #   end
  #   @@concerts
  # end
end


#
# NYStateFairConcerts::ConcertScraper.new.make_concerts
