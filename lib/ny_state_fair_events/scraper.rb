class NYStateFairEvents::Scraper

  def get_page
    Nokogiri::HTML(open("fixtures/chevy-court-events-revised-links.html"))
  end

  def scrape_venue_summary
    self.get_page.css("div.clearfix p").first.text
  end

  def scrape_index_page
    self.get_page.css("tr.event-list-feed-item")
  end

  def make_events
    self.scrape_index_page.collect do |event|
      if not event.css("td.eventcol").text.include?("Parade") || event.css("td.eventcol").text.include?("parade") || event.css("td.timecol").text.include?("am")
        NYStateFairEvents::Concert.new(
          event.css("td.eventcol").text,
          event.css("td.datecol").text.gsub(/[\t\n]/, ""),
          event.css("td.timecol").text,
          event.css("a").attr("href")
        )
      elsif event.css("td.eventcol").text.include?("Parade") || event.css("td.eventcol").text.include?("parade")
        NYStateFairEvents::Parade.new(
          event.css("td.eventcol").text,
          event.css("td.datecol").text.gsub(/[\t\n]/, ""),
          event.css("td.timecol").text,
          event.css("a").attr("href")
        )
      else
        NYStateFairEvents::OtherEvent.new(
          event.css("td.eventcol").text,
          event.css("td.datecol").text.gsub(/[\t\n]/, ""),
          event.css("td.timecol").text,
          event.css("a").attr("href")
        )
      end
    end
  end


  # Need to be able to scrape concert summaries from within fixture html files since webpages will no longer exist after a certain point. Did the following to accomplish this task:
    # => Replaced concert URLs in chevy-court-events-revised-links.html with fixture html filenames
      # => chevy-court-events.html contains original html
    # => Added Concert attribute "filename"
      #  => Concert now initializes with filename instead of URL
    # => Updated #details method to scrape the fixture concert html file instead of the concert webpage
    # => Added #url method to scrape the concert URL from the fixture concert html file
      # => Included the concert URL at the top of the fixture concert html file for easy access
    # => Doesn't impact parades and other events since all other events ONLY scrape from chevy-court-events-revised-links.html

  # Methods to scrape concert URLs & summaries below:

  def details(concert)
    Nokogiri::HTML(open(concert.filename))
  end

  def url(concert)
    self.details(concert).css("link").attr("href")
  end

  def summary(concert)
    self.details(concert).css("div.entry-content p").first.text
  end

end
