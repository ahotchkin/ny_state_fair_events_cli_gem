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
    # puts "-----------------------#{self.band.upcase}-----------------------"
    # puts "Performing on #{self.date} at #{self.time}"
    # puts "-" * self.band.length + "----------------------------------------------"
    # puts "#{self.summary}"
    # puts ""
    # puts "For more information visit: #{self.url}"
    # puts "-" * self.band.length + "----------------------------------------------"

    dashes = (self.date.length - self.band.length).abs / 2
    puts "-" * dashes.to_i + "-------#{self.band.upcase}-------" + "-" * dashes.to_i
    puts "Performing on #{self.date} at #{self.time}"
    puts "-" * (self.date.length + self.band.length) + "--------------"
    puts "#{self.summary}"
    puts ""
    puts "For more information visit: #{self.url}"
    puts "-" * (self.date.length + self.band.length) + "--------------"
  end

end
