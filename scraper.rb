require "nokogiri"
require "open-uri"
require "pry"



class Scraper
  def self.scrape_nba_players_urls()
    players_urls = []
    doc = Nokogiri::HTML(open("https://www.basketball-reference.com/leagues/NBA_2018_per_game.html"))
   
    doc.css("tr.full_table").each do |player_profile|
      player_profile.css('td.left[data-stat="player"] a').each do |player_url|
        player_link = player_url.attr("href")
        player_urls << player_link
      end
    end
    players_urls
  end
end

