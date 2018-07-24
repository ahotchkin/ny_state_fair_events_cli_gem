class NYStateFairConcerts::Concerts

  def self.all
    puts <<-DOC.gsub /^\s*/, ''
      1. Chevy Court TBA - Aug. 22 @ 2pm
      2. Blondie
      3. Dave Mason and Steve Cropper
    DOC
  end

end
