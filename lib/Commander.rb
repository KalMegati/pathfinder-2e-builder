require_relative "Archivist.rb"
require_relative "Builder.rb"

class Commander

  attr_reader :archivist, :builder

  def titlecard
    puts "__________________________________________________________________"
    puts "                __  .__     _____.__            .___             "
    puts "  ___________ _/  |_|  |___/ ____\\__| ____    __| _/___________  "
    puts "  \\____ \\__  \\\\   __\\  |  \\   __\\|  |/    \\  / __ |/ __ \\_  __ \\ "
    puts "  |  |_> > __ \\|  | |   Y  \\  |  |  |   |  \\/ /_/ \\  ___/|  | \\/ "
    puts "  |   __(____  /__| |___|  /__|  |__|___|  /\\____ |\\___  >__|    "
    puts "  |__|       \\/          \\/              \\/      \\/    \\/        "
    puts "__________________________________________________________________"
    puts
    puts "Welcome to Pathfinder, a game of adventure and imagination."
    puts "This application will help you organize basic character ideas."
    puts "__________________________________________________________________"
    puts 
  end

  def menucard
    puts " 1 - build new character"
    puts " 2 - list all existing characters"
    puts " 3 - display card of existing character"
    puts " 4 - exit application"
    puts
    print "Enter a number from the list above: "

    menu = gets.chomp.to_i
    
    if menu == 1
      prompter
      menucard
    elsif menu == 2
      Builder.all.each {|character|
        print character.name + ": "
        print character.ancestries + ", "
        print character.backgrounds + ", "
        print character.classes
        puts
      }
      puts "Press ENTER to return to the main menu."
      gets
      menucard
    elsif menu == 3
      puts "Display which character?"
      char_name = gets.chomp
      character = Builder.all.detect{|char|char.name == char_name}
      if character
        sel_screen(character)
      else
        puts "That character does not exist."
      end
      puts "Press ENTER to return to the main menu."
      gets
      menucard
    elsif menu == 4
      terminus
    else
      puts "..............."      
      puts ":INVALID INPUT:"
      puts "```````````````"
      puts
      menucard
    end

  end

  def terminus
    puts
    puts "Fare thee well, and may your ventures be magical!"
    puts
    puts "__________________________________________________________________"
    puts "                __  .__     _____.__            .___             "
    puts "  ___________ _/  |_|  |___/ ____\\__| ____    __| _/___________  "
    puts "  \\____ \\__  \\\\   __\\  |  \\   __\\|  |/    \\  / __ |/ __ \\_  __ \\ "
    puts "  |  |_> > __ \\|  | |   Y  \\  |  |  |   |  \\/ /_/ \\  ___/|  | \\/ "
    puts "  |   __(____  /__| |___|  /__|  |__|___|  /\\____ |\\___  >__|    "
    puts "  |__|       \\/          \\/              \\/      \\/    \\/        "
    puts "__________________________________________________________________"
    puts
  end

  def startup
  
    puts "A legend begins with a name."
    puts
    puts "                              Who are you?"
  
  end

  def sel_concept
  
    name = gets.chomp
    @archivist = Archivist.new
    @builder = Builder.new(name)
  
  end

  def sel_screen(character)
    
    puts " _______________ ___ ___ ___ __ __ __ _ _ _"
    puts "|" 
    puts "| #{character.name}"
    puts "|_______________ ___ ___ ___ __ __ __ _ _ _"
    puts "|" if character.ancestries
    puts "| Ancestry:   #{character.ancestries}" if character.ancestries
    puts "| Background: #{character.backgrounds}" if character.backgrounds
    puts "| Class:      #{character.classes}" if character.classes
    puts "|" if character.classes
    puts "'"
    puts "'"
    puts "'"

  end

  def sel_aspect(aspect, character)
    
    @archivist.send(aspect).keys.each_with_index { |option, index| puts "#{index+1} - #{option}"}
    
    choice = gets.chomp until @archivist.confirm(choice, aspect)
    
    @archivist.summarize(choice, aspect)
    
    puts "Will you play a #{choice}? Y/N"
    
    confirm = gets.chomp.capitalize[0]
    
    if confirm == "Y"
      character.send("#{aspect}=", choice)
    else
      sel_aspect(aspect, character)
    end
    
  end

  def prompter
    startup
    character = sel_concept
    sel_screen(@builder)
    sel_aspect(:ancestries, @builder)
    sel_aspect(:backgrounds, @builder)
    sel_aspect(:classes, @builder)
    sel_screen(@builder)
    puts "Press ENTER to return to the main menu."
    gets
  end

end

hell = Commander.new

hell.titlecard
hell.menucard