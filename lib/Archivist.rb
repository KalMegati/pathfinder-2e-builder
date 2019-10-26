require 'pry'
require 'open-uri'
require 'nokogiri'

class ABCs
  
  attr_reader :ancestries, :backgrounds, :classes
  
  @@source = "https://2e.aonprd.com/"
  
  def archivist(aspect)
    Nokogiri::HTML(open(@@source+aspect+'.aspx'))
  end
  
  def hasher(aspect, header)
    dictionary = {}
    archivist(aspect).css("#{header} a").each{ |role|
      if role.attribute("href").value.include?("#{aspect}.aspx?ID")
        dictionary[role.text] = role.attribute("href").value
      end
    }
    dictionary
  end
  
  def initialize
    @ancestries = hasher("Ancestries", "h2")
    @backgrounds = hasher("Backgrounds", "h1")
    @classes = hasher("Classes", "h1")
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
    return true if $abcs.send("#{aspect}").include?(option)
    puts "Choose from the list of #{aspect} above."
  end  

end

#why = ABCs.new

#why.summarize("Dwarf", "ancestries")

#binding.pry

#hell = blurb.text.scan(/Ability Boost|Strength|Dexterity|Constitution|Intelligence|Wisdom|Charisma|Ability Flaw|Languages/)