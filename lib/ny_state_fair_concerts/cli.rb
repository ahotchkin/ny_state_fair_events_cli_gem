# CLI Controller - responsible for user interaction

class NYStateFairConcerts::CLI

  def call
    scraper = NYStateFairConcerts::ConcertScraper.new
    scraper.make_concerts
    puts ""
    puts "Welcome to the 2018 New York State Fair Chevy Court Concerts app!"
    puts ""
    puts "#{scraper.scrape_venue_summary}"
    menu
  end

  def menu
    input = ""
    while input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        What would you like to do?
        - Enter 'concerts' to see a list of all concerts
        - Enter 'parades' to see a list of all parades
        - Enter 'help' for instructions
        - Enter 'directions' for directions to Chevy Court
        - Enter 'exit' to exit
      DOC
      puts ""
      input = gets.strip.downcase

      if input == "concerts"
        list_concerts
      elsif input == 'parades'
        list_parades
      elsif input == "help"
        puts ""
        puts "This app is designed to provide information on all concerts taking place at Chevy Court during the 2018 New York State Fair. Follow the prompts for concert details."
      elsif input == "directions"
        puts ""
        puts "Click on the below link for directions to Chevy Court:"
        puts "https://www.google.com/maps/place/43.0720149%2C-76.2153672"
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
    NYStateFairConcerts::Concert.list_all

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

      if input.to_i > 0 && input.to_i <= NYStateFairConcerts::Concert.all.length
        concert = NYStateFairConcerts::Concert.all[input.to_i-1]
        concert.concert_details
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

  def list_parades
    puts ""
    puts "2018 Chevy Court Parades:"
    puts ""
    NYStateFairConcerts::Parade.list_all

    input = ""
    while input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        Enter a parade number to get details on that parade. Otherwise, enter one of the following prompts:
        - Enter 'menu' to see the main menu
        - Enter 'exit' to exit
      DOC
      puts ""
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= NYStateFairConcerts::Parade.all.length
        parade = NYStateFairConcerts::Parade.all[input.to_i-1]
        parade.parade_details
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

  def goodbye
    puts ""
    puts "Hope to see you at Chevy Court this year!"
    puts ""
    exit
  end

end
