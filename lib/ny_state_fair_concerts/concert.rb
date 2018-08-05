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

  def self.new_from_index_page(concert)
    self.new(
      concert.css("td.eventcol").text,
      concert.css("td.datecol").text.gsub(/[\t\n]/, ""),
      concert.css("td.timecol").text,
      concert.css("a").attribute("href").value
    )
  end

  def self.all
    @@all
  end

  def details
    @details ||= Nokogiri::HTML(open(self.url))
  end

  def summary
    @summary ||= details.css("div.entry-content p").first.text
    # doesn't work for Smokey Robinson - only one without p tag
  end

end
