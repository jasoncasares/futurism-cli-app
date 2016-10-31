class Futurism::News
  attr_accessor :name, :summary, :href, :content

  def self.today
      self.scrape_news
  end

  def self.scrape_news
    news = []
    news << self.scrape_futurism
    news
  end

  def self.scrape_titles
    @doc = Nokogiri::HTML(open("http://futurism.com/"))

    name = []
    @doc.search("h3.featured-story-title").each do |h3|
      name << h3.text.strip
    end
    name
  end

  def self.scrape_summaries
    @doc = Nokogiri::HTML(open("http://futurism.com/"))
    summaries = @doc.search("a.main-link").attribute("href")
    #summaries.split("Read More")
  end

  def self.scrape_urls
    @doc = Nokogiri::HTML(open("http://futurism.com/"))

    hrefs = []
    @doc.search("a.main-link a").each do |a|
      hrefs << a.attr("href")
    end
    hrefs
  end

  def self.scrape_content(url)
    raise url.inspect
    @doc = Nokogiri::HTML(open(url))
    content = @doc.search("div.summary module").text.strip
  end


end
