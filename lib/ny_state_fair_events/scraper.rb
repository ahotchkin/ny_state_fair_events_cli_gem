class NYStateFairEvents::Scraper

  def get_page
    Nokogiri::HTML(open("https://nysfair.ny.gov/venue/chevy-court/"))
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
          event.css("a").attribute("href").value
        )
      elsif event.css("td.eventcol").text.include?("Parade") || event.css("td.eventcol").text.include?("parade")
        NYStateFairEvents::Parade.new(
          event.css("td.eventcol").text,
          event.css("td.datecol").text.gsub(/[\t\n]/, ""),
          event.css("td.timecol").text,
          event.css("a").attribute("href").value
        )
      else
        NYStateFairEvents::OtherEvent.new(
          event.css("td.eventcol").text,
          event.css("td.datecol").text.gsub(/[\t\n]/, ""),
          event.css("td.timecol").text,
          event.css("a").attribute("href").value
        )
      end
    end
  end


  # Methods specific to scraping the concert summaries:

  def details(concert)
    Nokogiri::HTML(open(concert.url))
  end

  def summary(concert)
    # Need to use if statement because Smokey Robinson's page is the only one without a <p> tag
    if concert.url == "https://nysfair.ny.gov/event/smokey-robinson/"
      self.details(concert).css("div.entry-content").first.text.match(/^.*Some.*$/).to_s
    else
      self.details(concert).css("div.entry-content p").first.text
    end
  end

end
