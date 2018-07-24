# CLI Controller - responsible for user interaction

class NYStateFairConcerts::CLI

  def call
    list_concerts
    menu
    goodbye
  end

  def list_concerts
    puts "2018 Chevy Court Concerts:"
    @concerts = NYStateFairConcerts::Concerts.all
  end

  def menu
    input = ""
    while input != "exit"
      puts <<-DOC.gsub /^\s*/, ""
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
      elsif input != "exit"
        puts "I'm sorry, I didn't catch that."
      end
    end
  end

  def goodbye
    puts "Hope to see you at Chevy Court this year!"
  end

end
