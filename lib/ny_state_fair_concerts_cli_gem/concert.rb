class NYStateFairConcerts::Concert
  attr_accessor :band, :date, :time, :url

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
      concert.css('td.eventcol').text,
      concert.css('td.datecol').text.gsub(/[\t\n]/, ''),
      concert.css('td.timecol').text,
      concert.css('a').attribute('href').value
    )
  end

  def self.all
    @@all
  end

end
