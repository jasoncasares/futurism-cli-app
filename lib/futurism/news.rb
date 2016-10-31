class Futurism::News
  attr_accessor :name, :href, :content

  def self.scrape_content(url)
    @doc = Nokogiri::HTML(open(url))
    content = @doc.search("div.summary.module").text.strip
  end

  def self.scrape_urls
    @doc = Nokogiri::HTML(open("http://futurism.com/"))

    hrefs = []
    @doc.search("h3.featured-story-title a").each do |a|
      hrefs << a.attr("href")
    end
    hrefs
  end

  def self.scrape_titles
    @doc = Nokogiri::HTML(open("http://futurism.com/"))

    name = []
    @doc.search("h3.featured-story-title").each do |h3|
      name << h3.text.strip
    end
    name
  end

end
