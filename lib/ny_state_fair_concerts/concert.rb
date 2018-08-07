class NYStateFairConcerts::Concert
  attr_accessor :band, :date, :time, :url, :summary

  @@all = []

  def initialize(band=nil, date=nil, time=nil, url=nil)
    @band = band
    @date = date
    @time = time
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def concert_details
    puts "-----------------------#{self.band.upcase}-----------------------"
    puts "Performing on #{self.date} at #{self.time}"
    puts "-" * self.band.length + "----------------------------------------------"
    puts "#{NYStateFairConcerts::ConcertScraper.summary(self)}"
    puts ""
    puts "For more information visit: #{self.url}"
    puts "-" * self.band.length + "----------------------------------------------"
  end

end
