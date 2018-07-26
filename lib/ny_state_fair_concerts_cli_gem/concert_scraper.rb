class NYStateFairConcerts::ConcertScraper
  def scrape_concerts
    doc = Nokogiri::HTML(open('https://nysfair.ny.gov/venue/chevy-court/'))

    # Concert: parsed_content.css('tr.event-list-feed-item td.eventcol')[i].text
    # Date: parsed_content.css('tr.event-list-feed-item td.datecol')[i].text.gsub(/[\t\n]/, '')
    # Time: parsed_content.css('tr.event-list-feed-item td.timecol')[i].text
    # Link: links[i]
    #
    # links = parsed_content.css('tr.event-list-feed-item a').map do |link|
    #   link.attribute('href').value
    # end
  end

end
