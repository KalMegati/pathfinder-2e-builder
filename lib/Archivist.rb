require 'pry'
require 'open-uri'
require 'nokogiri'

class Archivist
  
  attr_reader :ancestries, :backgrounds, :classes
  
  @@source = "https://2e.aonprd.com/"
  
  def page_finder(aspect)
    Nokogiri::HTML(open(@@source+aspect.to_s.capitalize+'.aspx'))
  end
  
  def hasher(aspect, header)
    dictionary = {}
    page_finder(aspect).css("#{header} a").each{ |role|
      if role.attribute("href").value.include?("#{aspect.to_s.capitalize}.aspx?ID")
        dictionary[role.text] = role.attribute("href").value
      end
    }
    dictionary
  end
  
  def initialize
    @ancestries = hasher(:ancestries, "h2")
    @backgrounds = hasher(:backgrounds, "h1")
    @classes = hasher(:classes, "h1")
  end
  
  def summarize(option, aspect) # => grabs flavor blurb
    page = "https://2e.aonprd.com/"+self.send("#{aspect}")[option]
    blurb = Nokogiri::HTML(open(page))
    #binding.pry
    if page.include?("Backgrounds")
      puts blurb.text.match(/pg. 6\d(.+)Choose/)[1]
    else
      puts blurb.css("i")[1].text
    end
  end

  def confirm(option, aspect)
    return true if self.send("#{aspect}").include?(option)
    puts "Choose from the list of #{aspect} above."
  end  

end