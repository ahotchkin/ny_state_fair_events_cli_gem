class NYStateFairConcerts::ConcertScraper

  @@concerts = {}
  def scrape_concerts
    document = Nokogiri::HTML(open('https://nysfair.ny.gov/venue/chevy-court/'))
    concerts = document.css('tr.event-list-feed-item td.eventcol')
    band = concerts.css('td.eventcol')[i].text
    date = concerts.css('td.datecol')[i].text.gsub(/[\t\n]/, '')
    time = concerts.css('td.timecol')[i].text
    links = concerts.css('a').map { |link| link.attribute('href').value }
    link = links[i]

    # Concerts = document.css('tr.event-list-feed-item td.eventcol')
    # Band: concerts.css('td.eventcol')[i].text
    # Date: concerts.css('td.datecol')[i].text.gsub(/[\t\n]/, '')
    # Time: concerts.css('td.timecol')[i].text
    # Link: links[i]
    # links = concerts.css('a').map { |link| link.attribute('href').value }
  end

end
