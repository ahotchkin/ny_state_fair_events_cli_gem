# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      Created a CLI class (NYStateFairConcerts::CLI) that, upon calling, creates a new instance of the scraper class (NYStateFairConcerts::ConcertScraper) (details on the scraper class described below). A menu appears asking the user to enter a prompt depending on what they'd like to do. The CLI accepts the user input, allowing the user to interact with the program.

- [x] Pull data from an external source
      Scraped data from the following website: https://nysfair.ny.gov/venue/chevy-court/. All scraping logic is housed in the scraper class (NYStateFairConcerts::ConcertScraper). #make_concerts uses the data scraped from the website to create new instances of the concert class (NYStateFairConcerts::Concert) for the user to interact with.

- [x] Implement both list and detail views
      Initially a user is given an option to view a list of concerts by typing 'concerts' in the CLI (one of four available prompts listed in the main menu). A numbered list of concerts appears, and a user is able to type any concert number to get more details on that concert (date, time, url).
