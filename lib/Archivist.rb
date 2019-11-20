require 'pry'
require 'open-uri'
require 'nokogiri'

class Archivist
  
  attr_reader :ancestries, :backgrounds, :classes
  
  @@source = "https://2e.aonprd.com/"

  @@ance_parser = /Ability Boosts(Str.+|Dex.+|Con.+|Int.+|Wis.+|Cha.+)(Str.+|Dex.+|Con.+|Int.+|Wis.+|Cha.+)FreeAbility Flaw\(s\)(Str.+|Dex.+|Con.+|Int.+|Wis.+|Cha.+)Languages/
  
  @@back_parser = /be to (Str.+|Dex.+|Con.+|Int.+|Wis.+|Cha.+) or (Str.+|Dex.+|Con.+|Int.+|Wis.+|Cha.+), and one/

  @@clas_parser = /(STR\w+|DEX\w+|CON\w+|INT\w+|WIS\w+|CHA\w+)/

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
    if page.include?("Backgrounds")
      puts blurb.text.match(/pg. 6\d(.+)Choose/)[1]
    else
      puts blurb.css("i")[1].text
    end
  end

  def ance_stats(option, aspect) # => grabs stats from ancestry
    page = "https://2e.aonprd.com/"+self.send("#{aspect}")[option]
    blurb = Nokogiri::HTML(open(page))
    blurb.text.match(@@ance_parser)
  end

  def back_stats(option, aspect) # => grabs stats from background
    page = "https://2e.aonprd.com/"+self.send("#{aspect}")[option]
    blurb = Nokogiri::HTML(open(page))
    blurb.text.match(@@back_parser)
  end

  def clas_stats(option, aspect) # => grabs stats from class
    page = "https://2e.aonprd.com/"+self.send("#{aspect}")[option]
    blurb = Nokogiri::HTML(open(page))
    binding.pry
    blurb.css("b")[2].text.match(@@clas_parser)
  end

  def confirm(option, aspect)
    return true if self.send("#{aspect}").include?(option)
    puts "Choose from the list of #{aspect} above."
  end  

end

#Archivist.new.ance_stats("Dwarf", :ancestries)

#binding.pry