
class Markets::News

  attr_accessor :title, :author, :link, :description, :date, :content


  def self.scrape_page
    Nokogiri::HTML(open("https://www.theatlantic.com/business/"))
  end

  def self.get_story(link)
    doc = Nokogiri::HTML(open(link)).css("ul.river")
    doc.children.each { |c| c.remove if c.name == 'div'}
    doc.text.strip
  end

  def self.create_stories

    stories = []

    scrape_page.css("ul.river li.article.blog-article").each do |article|
      story = self.new
      story.title = article.css("h2.hed").text
      story.content = article.css("p.dek.has-dek").text
      story.author = article.css("ul li.byline a").text
      story.date = article.css(".date").text,
      story.link = article.css("a").attribute('href').value
      stories << story
    end
    stories
  end
end
