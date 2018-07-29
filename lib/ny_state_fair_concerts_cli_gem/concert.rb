class NYStateFairConcerts::Concerts
  attr_accessor :band, :date, :time, :url

  def initialize(band=nil, date=nil, time=nil, url=nil)
    @band = band
    @date = date
    @time = time
    @url = url
  end

  def self.new_from_index_page(concert)
    self.new(
      concert.css('td.eventcol').text,
      concert.css('td.datecol').text.gsub(/[\t\n]/, ''),
      concert.css('td.timecol').text,
      concert.css('a').attribute('href').value
    )
  end


  def self.all
    # @@all ||= scrape_concerts

    # Scrape https://nysfair.ny.gov/venue/chevy-court/ for concert data

    # concert_1 = self.new
    # concert_1.band = "Chevy Court TBA - Aug. 22 @ 2pm"
    # concert_1.date = "Wednesday, August 22, 2018"
    # concert_1.time = "2:00pm"
    # concert_1.url = "https://nysfair.ny.gov/event/chevy-court-tba-aug-22-2pm/"
    #
    # concert_2 = self.new
    # concert_2.band = "Blondie"
    # concert_2.date = "Wednesday, August 22, 2018"
    # concert_2.time = "8:00pm"
    # concert_2.url = "https://nysfair.ny.gov/event/blondie/"
    #
    # concert_3 = self.new
    # concert_3.band = "Dave Mason and Steve Cropper"
    # concert_3.date = "Thursday, August 23, 2018"
    # concert_3.time = "2:00pm"
    # concert_3.url = "https://nysfair.ny.gov/event/dave-mason-steve-cropper/"

    # [concert_1, concert_2, concert_3]
    # method should return an array of all concerts: [concert_1, concert_2, concert_3]

  end

  # private
  #   def self.scrape_concerts
  #     concerts = Nokogiri::HTML(open('https://nysfair.ny.gov/venue/chevy-court/'))
  #     # concerts = document.css('tr.event-list-feed-item')
  #     concerts.css('tr.event-list-feed-item').each.with_index(1) do |concert, i|
  #       # binding.pry
  #       concert = self.new
  #       concert.band = concerts.css('td.eventcol')[i].text
  #       concert.date = concerts.css('td.datecol')[i].text.gsub(/[\t\n]/, '')
  #       concert.time = concerts.css('td.timecol')[i].text
  #       # concert.links = concerts.css('a').map { |link| link.attribute('href').value }
  #     end
  #   end

  #   # Concerts = document.css('tr.event-list-feed-item td.eventcol')
  #   # Band: concerts.css('td.eventcol')[i].text
  #   # Date: concerts.css('td.datecol')[i].text.gsub(/[\t\n]/, '')
  #   # Time: concerts.css('td.timecol')[i].text
  #   # Link: links[i]
  #   # links = concerts.css('a').map { |link| link.attribute('href').value }
  # end
  #
  # def self.make_concerts
  #   self.scrape_concerts.each do |concert|
  #     # binding.pry
  #     concert = self.new
  #     concert.band = concert.css('td.eventcol').text
  #     concert.date = concert.css('td.datecol').text.gsub(/[\t\n]/, '')
  #     concert.time = concert.css('td.timecol').text
  #     concert.links = concert.css('a').map { |link| link.attribute('href').value }
  #   end
  # end

end
