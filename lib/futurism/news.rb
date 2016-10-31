class Futurism::News
  attr_accessor :name, :url

  def self.today
      self.scrape_news
  end

  def self.scrape_news
    news = []
    news << self.scrape_futurism
    news
  end

  def self.scrape_futurism
    doc = Nokogiri::HTML(open("http://futurism.com/"))
    #Create articles
    doc.search("h3.featured-story-title")[2..-1].each do |article|
      # instantiates article
      news = self.new
      news.name = doc.search("h3.featured-story-title").first.text.strip
      news.url = doc.search("a.main-link ").first.attr("href")
      news
      #binding.pry
    end
  end
end
