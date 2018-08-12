# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      Created a CLI class (NYStateFairEvents::CLI) that, upon calling, creates a new instance of the scraper class (NYStateFairEvents::Scraper) (details on the scraper class described below). A menu appears asking the user to enter a prompt depending on what they'd like to do. The CLI accepts the user input, allowing the user to interact with the program.

- [x] Pull data from an external source
      Scraped data from the following website: https://nysfair.ny.gov/venue/chevy-court/. All scraping logic is housed in the scraper class (NYStateFairEvents::Scraper). #make_events uses the data scraped from the website to create new instances of one of three classes: concert (NYStateFairEvents::Concert), parade (NYStateFairEvents::Parade), or other (NYStateFairEvents::Other) for the user to interact with.

- [x] Implement both list and detail views
      Initially a user is given an option to view a list of events by typing 'concerts', 'parades', or 'other' in the CLI. A numbered list of corresponding events appears, and a user is able to type any event number to get more details on that event (date, time, url).
