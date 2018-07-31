# CLI Controller - responsible for user interaction

class NYStateFairConcerts::CLI

  def call
    NYStateFairConcerts::ConcertScraper.new.make_concerts
    list_concerts
    menu
    goodbye
  end

  def list_concerts
    puts "2018 Chevy Court Concerts:"
    @concerts = NYStateFairConcerts::Concert.all
    @concerts.each.with_index(1) do |concert, i|
      puts "#{i}. #{concert.band}"
    end
  end

  def menu
    input = ""
    while input != "exit"
      puts <<-DOC.gsub /^\s*/, ""
        Enter one of the following prompts:
        - Concert number to get more information on a specific concert
        - 'Concerts' to list all Concerts
        - 'Exit' to exit
      DOC
      input = gets.strip.downcase

      if input.to_i > 0
        concert = @concerts[input.to_i-1]
        puts <<-DOC.gsub /^\s*/, ""
          #{concert.band}
          #{concert.date} at #{concert.time}
          #{concert.url}
        DOC
      elsif input == 'concerts'
        list_concerts
      elsif input != "exit"
        puts "I'm sorry, I didn't catch that."
      end
    end
  end

  def goodbye
    puts ""
    puts "Hope to see you at Chevy Court this year!"
    puts ""
  end

end
