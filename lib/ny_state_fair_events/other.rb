require 'pry'

class NYStateFairEvents::Other
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
    names = @@all.map { |other| other.name }.uniq
    names.each.with_index(1) do |other, i|
      puts "#{i}. #{other}"
    end
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
  end

end
