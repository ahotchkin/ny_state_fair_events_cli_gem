# CLI Controller - responsible for user interaction

class NYStateFairEvents::CLI

  def call
    scraper = NYStateFairEvents::Scraper.new
    scraper.make_events
    puts ""
    puts "Welcome to the 2018 New York State Fair Chevy Court Events app!"
    puts ""
    puts "#{scraper.scrape_venue_summary}"
    menu
  end

  def menu
    menu_input = ""
    while menu_input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        What would you like to do?
        - Enter 'concerts' to see a list of all concerts
        - Enter 'parades' to see a list of all parades
        - Enter 'other' to see a list of all other events
        - Enter 'help' for instructions
        - Enter 'directions' for directions to Chevy Court
        - Enter 'exit' to exit
      DOC
      puts ""
      menu_input = gets.strip.downcase

      if menu_input == "concerts"
        list_concerts
      elsif menu_input == "parades"
        list_parades
      elsif menu_input == "other"
        list_other_events
      elsif menu_input == "help"
        puts ""
        puts "This app is designed to provide information on all events taking place at Chevy Court during the 2018 New York State Fair. Follow the prompts for event details."
        puts ""
      elsif menu_input == "directions"
        puts ""
        puts "Click on the below link for directions to Chevy Court:"
        puts "https://www.google.com/maps/place/43.0720149%2C-76.2153672"
        puts ""
      elsif menu_input != "exit"
        puts ""
        puts "I'm sorry, I didn't catch that."
      elsif menu_input == "exit"
        goodbye
      end
    end
  end

  def list_concerts
    puts ""
    puts "2018 Chevy Court Concerts:"
    puts ""
    NYStateFairEvents::Concert.list_all

    concert_input = ""
    while concert_input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        Enter a concert number to get details on that concert. Otherwise, enter one of the following prompts:
        - Enter 'menu' to see the main menu
        - Enter 'exit' to exit
      DOC
      puts ""
      user_interface(NYStateFairEvents::Concert)
    end
  end

  def list_parades
    puts ""
    puts "2018 Chevy Court Parades:"
    puts ""
    NYStateFairEvents::Parade.list_all

    parade_input = ""
    while parade_input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        Enter a parade number to get details on that parade. Otherwise, enter one of the following prompts:
        - Enter 'menu' to see the main menu
        - Enter 'exit' to exit
      DOC
      puts ""
      user_interface(NYStateFairEvents::Parade)
    end
  end

  def user_interface(event_class)
    event_name = "#{event_class}".delete "NYStateFairEvents::"
    puts "enter a #{event_name.downcase} number to get details on that #{event_name.downcase}"
    input = gets.strip.downcase

    if input.to_i.between?(1, event_class.all.length)
      event = event_class.all[input.to_i-1]
      event.details
    elsif input == "menu"
      menu
    elsif input != "exit"
      puts ""
      puts "I'm sorry, I didn't catch that."
    elsif input == "exit"
      goodbye
    end
  end

  def list_other_events
    puts ""
    puts "2018 Chevy Court Events:"
    puts ""
    NYStateFairEvents::OtherEvent.list_all

    other_input = ""
    while other_input != "exit"
      puts ""
      puts <<-DOC.gsub /^\s*/, ""
        Enter an event number to get details on that event. Otherwise, enter one of the following prompts:
        - Enter 'menu' to see the main menu
        - Enter 'exit' to exit
      DOC
      puts ""
      other_input = gets.strip.downcase

      if other_input.to_i.between?(1, NYStateFairEvents::OtherEvent.all_unique.length)
        other = NYStateFairEvents::OtherEvent.all[other_input.to_i-1]
        other.other_event_details
      elsif other_input == "menu"
        menu
      elsif other_input != "exit"
        puts ""
        puts "I'm sorry, I didn't catch that."
      elsif other_input == "exit"
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
