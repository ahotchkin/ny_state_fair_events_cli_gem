# CLI Controller - responsible for user interaction

class NyStateFairConcerts::CLI

  def call
    list_concerts
    menu
    goodbye
  end

  def list_concerts
    puts "2018 Chevy Court Concerts:"
    puts <<-DOC.gsub /^\s*/, ''
      1. Chevy Court TBA - Aug. 22 @ 2pm
      2. Blondie
      3. Dave Mason and Steve Cropper
    DOC
  end

  def menu
    input = ''
    while input != 'exit'
      puts <<-DOC.gsub /^\s*/, ''
        Enter one of the following prompts:
        - Concert number to get more information on a specific concert
        - Concerts to list all Concerts
        - Exit
      DOC
      input = gets.strip.downcase
      if input == "1"
        puts "date, time, and url for concert 1"
      elsif input == "2"
        puts "date, time, and url for concert 2"
      elsif input == "3"
        puts "date, time, and url for concert 3"
      elsif input == 'concerts'
        list_concerts
      else
        puts "I'm sorry, I didn't catch that."
      end
    end
  end

  def goodbye
    puts "Hope to see you at Chevy Court this year!"
  end

end
