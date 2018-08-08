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

  def self.list_all
    @@all.each.with_index(1) do |concert, i|
      puts "#{i}. #{concert.band}"
    end
  end

  def summary
    @summary ||= NYStateFairConcerts::ConcertScraper.summary(self)
  end

  def concert_details
    # Is there a way to clean this up?
    line = "-" * (self.date.length) + "-" * 30
    top_dashes = "-" * (((line.length / 2).to_f) - ((self.band.length / 2).to_f)).abs
    bottom_dashes = ("-" * (top_dashes.length * 2)) + ("-" * self.band.length)

    puts top_dashes + "#{self.band.upcase}" + top_dashes
    puts "Performing on #{self.date} at #{self.time}"
    puts bottom_dashes
    puts "#{self.summary}"
    puts ""
    puts "For more information visit: #{self.url}"
    puts bottom_dashes
  end

end
