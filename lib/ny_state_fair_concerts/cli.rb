# CLI Controller - responsible for user interaction

class NYStateFairConcerts::CLI

  def call
    NYStateFairConcerts::ConcertScraper.new.make_concerts
    puts ""
    puts "Welcome to the 2018 New York State Fair Concerts app!"
    menu
  end

  def menu
    input = ""
    while input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        What would you like to do?
        - Enter 'concerts' to see a list of all concerts
        - Enter 'help' for instructions
        - Enter 'directions' for directions to Chevy Court
        - Enter 'exit' to exit
      DOC
      puts ""
      input = gets.strip.downcase

      if input == "concerts"
        list_concerts
      elsif input == "help"
        puts ""
        puts "This app is designed to provide information on all concerts taking place at Chevy Court during the 2018 New York State Fair. Follow the prompts for concert details."
      elsif input == "directions"
        directions
      elsif input != "exit"
        puts ""
        puts "I'm sorry, I didn't catch that."
      elsif input == "exit"
        goodbye
      end
    end
  end

  def list_concerts
    puts ""
    puts "2018 Chevy Court Concerts:"
    puts ""
    @concerts = NYStateFairConcerts::Concert.all
    @concerts.each.with_index(1) do |concert, i|
      puts "#{i}. #{concert.band}"
    end

    input = ""
    while input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        Enter a concert number to get details on that concert. Otherwise, enter one of the following prompts:
        - Enter 'menu' to see the main menu
        - Enter 'exit' to exit
      DOC
      puts ""
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 26
        concert = @concerts[input.to_i-1]
        puts <<-DOC.gsub /^\s*/, ""
          -------------------#{concert.band.upcase}-------------------
          Date & Time: #{concert.date} at #{concert.time}
          Link: #{concert.url}
          ------------------------------------------------------------
          #{concert.summary}
          ------------------------------------------------------------
          DOC
      elsif input == 'menu'
        menu
      elsif input != "exit"
        puts ""
        puts "I'm sorry, I didn't catch that."
      elsif input == "exit"
        goodbye
      end
    end
  end

  def directions
    puts ""
    puts "Click on the below link for directions to Chevy Court:"
    puts "https://www.google.com/maps/place/43.0720149,-76.2153672"
    puts ""
  end

  def goodbye
    puts ""
    puts "Hope to see you at Chevy Court this year!"
    puts ""
    exit
  end

end