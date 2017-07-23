class Markets::CLI

  @story_items = []

  def call
    list_stories
    menu
  end

  def list_stories
    puts "\e[H\e[2J"
    puts "Here's the latest finance news from The Atlantic: "
    puts ""
    @story_items = Markets::News.create_stories
    @story_items.each.with_index(1) do |story, i|
      puts "\t#{i}. #{story.title}\n"
      puts " "
      puts "\tPublished on #{story.date.first}\tWritten by #{story.author}\n"
      puts " "
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the news story you would like to read or type 'list' to see the article list again or 'exit' to exit:"
      input = gets.strip.downcase
      if input.to_i > 0 && @story_items[input.to_i-1] != nil
        the_story = @story_items[input.to_i-1]

        puts "\e[H\e[2J"
        puts "\t#{the_story.title}\n"
        puts "\n\tPublished on #{the_story.date.first}\tWritten by #{the_story.author}\n"
        puts "\n\tStory summary: "
        puts "\t#{the_story.content}"
        puts "\nRead more here by following this link:\nhttps://www.theatlantic.com/business/#{the_story.link}"

      elsif input == "list"
          list_stories
      elsif input == "exit"
        puts "\e[H\e[2J"
      end_program
      else
        puts "Error, please enter the number of the story you wish to read!"
      end
    end
  end

  def end_program
    puts "Thank you for using the Markets gem, come back soon!"
  end
end
