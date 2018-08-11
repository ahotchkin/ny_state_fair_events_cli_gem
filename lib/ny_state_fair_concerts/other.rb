class NYStateFairConcerts::Other
  attr_accessor :name, :date, :time, :url

  @@all = []

  def initialize(name=nil, date=nil, time=nil, url=nil)
    @name = name
    @date = date
    @time = time
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_all
    @@all.each.with_index(1) do |other, i|
      puts "#{i}. #{other.name}"
    end
  end

  def other_details

    line = "-" * (self.date.length) + "-" * 30
    top_dashes = "-" * (((line.length / 2).to_f) - ((self.name.length / 2).to_f)).abs
    bottom_dashes = ("-" * (top_dashes.length * 2)) + ("-" * self.name.length)

    puts top_dashes + "#{self.name.upcase}" + top_dashes
    @@all.each.with_index(1) do |other, i|
      puts "#{i}. #{other.date} at #{other.time}"
    end
    puts ""
    puts "For more information visit: #{self.url}"
    puts bottom_dashes
  end

end
