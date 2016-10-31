class Futurism::CLI

  def call
    list_news
    menu
    goodbye
  end

  def list_news
    puts "Welcome to Futurism"
    news = Futurism::News.scrape_titles
    news.each.with_index(1) do |news, i|
      puts "#{i}. #{news}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number for the article you'd like to read or type list to see the latest news again or type exit."
      input = gets.strip.downcase

      news = Futurism::News.scrape_titles
      urls = Futurism::News.scrape_urls

      if input.to_i > 0
        news_title = news[input.to_i-1]
        url = urls[input.to_i-1]

        puts news_title
        puts "Would you like to read more?"

        answer = gets.strip
        if ["Y", "YES"].include?(answer.upcase)
          content = Futurism::News.scrape_content(url)

          puts content
        end

      elsif input == "list"
        list_news
      else
        puts "Not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "See you tomorrow for more news!"
  end

end
