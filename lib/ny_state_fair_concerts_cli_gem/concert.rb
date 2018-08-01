class NYStateFairConcerts::Concert
  attr_accessor :band, :date, :time, :url, :summary, :directions

  @@all = []

  def initialize(band=nil, date=nil, time=nil, url=nil)
    @band = band
    @date = date
    @time = time
    @url = url
    @@all << self
  end

  def self.new_from_index_page(concert)
    self.new(
      concert.css("td.eventcol").text,
      concert.css("td.datecol").text.gsub(/[\t\n]/, ""),
      concert.css("td.timecol").text,
      concert.css("a").attribute("href").value
    )
  end

  # need to work on #summary and #directions
  def summary(concert)
    concert = Concert.new
    self.summary = NYStateFairConcerts::ConcertScraper.self.scrape_summary
  end

  def directions(concert)
  end

  def self.all
    @@all
  end

end
