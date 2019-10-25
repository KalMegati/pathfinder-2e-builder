require_relative 'Archivist.rb'

class Adventurer
  
  attr_accessor :name, :ancestry, :background, :class, :description
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  # def self.lookup(option)
  #   until 
  #   if ABCs.ancestries.keys.include?(option)
      
  #   elsif 
      
  #   elsif
    
  #   else
  #     puts
  #   end
  #   @@all.select{ |char| char.send("#{aspect}") == option }
  # end
  
end