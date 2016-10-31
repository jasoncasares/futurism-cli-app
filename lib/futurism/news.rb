class Futurism::News
  attr_accessor :name, :url

  def self.today
    # Scrape Futurism and then return news data
    self.scrape_news
  end

  def self.scrape_news
    news = []

    news << self.scrape_futurism
    # Go to Futurism, find the news
    # extract the properties
    #instantiates news
    news
  end

  def self.scrape_futurism
    doc = Nokogiri::HTML(open("http://futurism.com/"))

    while doc.search("a.main-link").each do |news|
      news = self.new
      news.name = doc.search("h3.featured-story-title").first.text.strip
      news.url = doc.search("a.main-link ").first.attr("href")
      news
    end

  end
end
