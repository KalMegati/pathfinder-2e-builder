require_relative "Archivist.rb"
require_relative "Builder.rb"

class Commander

def startup
  
  puts "A legend begins with a name."
  puts
  puts "                              Who are you?"
  
end

def sel_concept
  
  name = gets.chomp
  @abcs = ABCs.new
  Adventurer.new(name)
  
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
  
  puts @abcs.send(aspect).keys
  
  puts "Select a #{aspect.to_s.capitalize}"
  
  choice = gets.chomp.capitalize until @abcs.confirm(choice, aspect)
  
  @abcs.summarize(choice, aspect)
  
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
  sel_screen(character)
  sel_aspect(:ancestries, character)
  sel_aspect(:backgrounds, character)
  sel_aspect(:classes, character)
  sel_screen(character)
end

end

Commander.new.prompter