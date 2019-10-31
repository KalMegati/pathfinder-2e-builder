require_relative "Archivist.rb"
require_relative "Builder.rb"

class Commander

  attr_reader :archivist, :builder

  def titlecard
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
    puts " 2 - create or modify character description"
    puts " 3 - list all existing characters"
    puts " 4 - search existing characters by aspect"
    puts
    print "Enter a number from the list above: "

    menu = gets.chomp.to_i
    
    if menu == 1
      prompter
    else
      puts "..............."      
      puts ":INVALID INPUT:"
      puts "```````````````"
      puts
      menucard
    end

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
    
    @archivist.send(aspect).keys.each_with_index { |option, index| puts "#{index} - #{option}"}
    
    puts "Select a #{aspect.to_s.capitalize}"
    
    choice = gets.chomp.capitalize until @archivist.confirm(choice, aspect)
    
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
  end

end

hell = Commander.new

hell.titlecard
hell.menucard

#Commander.new.prompter