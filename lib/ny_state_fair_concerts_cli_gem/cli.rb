# CLI Controller - responsible for user interaction

class NyStateFairConcerts::CLI

  def call
    list_concerts
    menu
  end

  def list_concerts
    puts "2018 Chevy Court Concerts:"
    puts <<-DOC.gsub /^\s*/, ''
      1. Chevy Court TBA - Aug. 22 @ 2pm
      2. Blondie
      3. Dave Mason and Steve Cropper
      4. Chevy Court TBA - Aug. 23 @ 8pm
      5. Ravyn Lenae
    DOC
  end

  def menu
    puts "Enter the number of the concert you'd like more information on:"
  end

end
