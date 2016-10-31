class Futurism::CLI

  def call
    list_news
    menu
    goodbye
  end

  def list_news
    puts "Latest News"
    @news = Futurism::News.today
    @news.each.with_index(1) do |news, i|
      puts "#{i}. #{news.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number for the article you'd like to read or type list to see the latest news again or type exit."
      input = gets.strip.downcase

      if input.to_i > 0
        the_news = @news[input.to_i-1]
        puts "#{the_news.name}"
        puts "#{the_news.url}"
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
