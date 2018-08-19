class NYStateFairEvents::Other
  attr_accessor :name, :date, :time, :url

  @@all = []
  @@all_unique

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
    @@all_unique = @@all.map { |other| other.name }.uniq
    @@all_unique.each.with_index(1) do |other, i|
      puts "#{i}. #{other}"
    end
  end

  def self.all_unique
    @@all_unique
  end

  def other_details
    line = "-" * (self.date.length) + "-" * 20
    top_dashes = "-" * (((line.length / 2).to_f) - ((self.name.length / 2).to_f)).abs
    bottom_dashes = ("-" * (top_dashes.length * 2)) + ("-" * self.name.length)

    puts top_dashes + "#{self.name.upcase}" + top_dashes
    puts ""
    @@all.each.with_index(1) do |other, i|
      if other.name == self.name
        puts "#{other.date} at #{other.time}"
      end
    end
    puts ""
    puts "For more information visit: #{self.url}"
    puts bottom_dashes
    puts ""
  end

end
