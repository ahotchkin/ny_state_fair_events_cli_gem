class NYStateFairConcerts::Concerts
  attr_accessor :band, :date, :time, :url

  def self.all
    # puts <<-DOC.gsub /^\s*/, ''
    #   1. Chevy Court TBA - Aug. 22 @ 2pm
    #   2. Blondie
    #   3. Dave Mason and Steve Cropper
    # DOC

    concert_1 = self.new
    concert_1.band = "Chevy Court TBA - Aug. 22 @ 2pm"
    concert_1.date = "Wednesday, August 22, 2018"
    concert_1.time = "2:00pm"
    concert_1.url = "https://nysfair.ny.gov/event/chevy-court-tba-aug-22-2pm/"

    concert_2 = self.new
    concert_2.band = "Blondie"
    concert_2.date = "Wednesday, August 22, 2018"
    concert_2.time = "8:00pm"
    concert_2.url = "https://nysfair.ny.gov/event/blondie/"

    concert_3 = self.new
    concert_3.band = "Dave Mason and Steve Cropper"
    concert_3.date = "Thursday, August 23, 2018"
    concert_3.time = "2:00pm"
    concert_3.url = "https://nysfair.ny.gov/event/dave-mason-steve-cropper/"

    [concert_1, concert_2, concert_3]
    # method should return an array of all concerts: [concert_1, concert_2, concert_3]

  end

end
