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

  def concert_details
    puts "-----------------------#{self.band.upcase}-----------------------"
    puts "Performing on #{self.date} at #{self.time}"
    puts "-" * self.band.length + "----------------------------------------------"
    puts "#{NYStateFairConcerts::ConcertScraper.summary(self)}"
    puts ""
    puts "For more information visit: #{self.url}"
    puts "-" * self.band.length + "----------------------------------------------"

    # puts "-" * (concert.date.length / 2 - concert.band.length / 2) + "-------#{concert.band.upcase}-------" + "-" * (concert.date.length / 2 - concert.band.length / 2)
    # puts "Performing on #{concert.date} at #{concert.time}"
    # puts "-" * concert.date.length + "-" * concert.band.length + "--------------"
    # puts "#{concert.summary}"
    # puts ""
    # puts "For more information visit: #{concert.url}"
    # puts "-" * concert.date.length + "-" * concert.band.length + "--------------"
  end

end
