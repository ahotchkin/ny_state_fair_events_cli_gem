NYStateFairEventsCLI will be a command-line app to allow a user to see a list of the Chevy Court events at the 2018 New York State Fair. When they run the app, they will see a greeting and be asked to enter a prompt.

Prompts:
	1. Concerts - will provide a numbered list of all Chevy Court concerts at the 2018 New York State Fair; data scraped from this website: https://nysfair.ny.gov/venue/chevy-court/
	2. Parades - will provide a numbered list of all Chevy Court parades at the 2018 New York State Fair; data scraped from this website: https://nysfair.ny.gov/venue/chevy-court/
	3. Other - will provide a numbered list of all other Chevy Court events at the 2018 New York State Fair; data scraped from this website: https://nysfair.ny.gov/venue/chevy-court/
	4. Help - will provide directions on how to use the app
	5. Exit - will exit the app

From the concert/parade/other list view, the user will have two options:
	1. Enter a number associated with an event to see details: date, time, url with more information
	2. Enter ‘back’ to go back to the main menu


Architecture
	- Concert class to represent each concert
	- Parade class to represent each parade
	- Other class to represent all other events
	- Scraper to do the scraping of the site and create the concerts
	- NYStateFairEventsCLI to interact with the user


First version:
A user will see the greeting and be asked to enter a prompt. If they choose 'concerts’ they’ll see a list of fake data that we hardcode into the app.


Scraping Practice
Concert: parsed_content.css('tr.event-list-feed-item td.eventcol')[i].text
	- can also use .search instead of .css
Date: parsed_content.css('tr.event-list-feed-item').css('.datecol’)[i].text.gsub(/[\t\n]/, '')
Time: parsed_content.css(‘tr.event-list-feed-item’).css(‘.timecol’)[i].text
Link: links[i]

links = parsed_content.css(‘tr.event-list-feed-item a’).map do |link|
		link.attribute(‘href’).value
	    end

Note:
After an event is over it disappears from the website. To account for this, the HTML files for the majority of the events have been added to the program to keep it running smoothly until the end of time.
