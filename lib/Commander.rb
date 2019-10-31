require_relative "Archivist.rb"
require_relative "Builder.rb"

class Commander

  attr_reader :archivist, :builder

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

Commander.new.prompter