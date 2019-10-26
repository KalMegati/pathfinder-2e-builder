require_relative "Archivist.rb"
require_relative "Builder.rb"

def startup
  
  puts "A legend begins with a name."
  puts
  puts "                              Who are you?"
  
end

def sel_concept
  
  name = gets.chomp
  $abcs = ABCs.new
  Adventurer.new(name)
  
end

def sel_screen(character)
  
  puts " _______________ ___ ___ ___ __ __ __ _ _ _"
  puts "|" 
  puts "| #{character.name}"
  puts "|_______________ ___ ___ ___ __ __ __ _ _ _"
  puts "|" if character.ancestry
  puts "| Ancestry:   #{character.ancestry}" if character.ancestry
  puts "| Background: #{character.background}" if character.background
  puts "| Class:      #{character.class}" if character.class
  puts "|" if character.class
  puts "'"
  puts "'"
  puts "'"

end

def sel_aspect(aspect, character)
  
  if aspect == :ancestry
    plu_aspect = :ancestries
  elsif aspect == :background
    plu_aspect = :backgrounds
  elsif aspect == :class
    plu_aspect = :classes
  end
  
  puts $abcs.send(plu_aspect).keys
  
  puts "Select a #{aspect.to_s.capitalize}"
  
  choice = gets.chomp.capitalize until $abcs.confirm(choice, plu_aspect)
  
  $abcs.summarize(choice, plu_aspect)
  
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
  sel_aspect(:ancestry, character)
  sel_aspect(:background, character)
  sel_aspect(:class, character)
  sel_screen(character)
end

prompter