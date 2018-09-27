class Scraper
  def self.start!
    FileUtils.rm_f Dir.glob("dicts/*")
    
    i = 0
    loop do
      Scraper.new(i).scrape!
      i += 1
    end
  end

  def initialize(num)
    @num = num
  end

  def scrape!
    puts "Scraping page #{@num}..."
    doc = HTTParty.get(
      "https://www.homestuck.com/story/#{@num}"
    )
    page = Nokogiri::HTML(doc)


    logs = page.css('.o_chat-log span')
    puts "Found #{logs.length} logs."
    return if logs.empty?

    LogSaver.new(logs).save!
  end
end