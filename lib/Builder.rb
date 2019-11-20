require_relative 'Archivist.rb'

class Builder
  
  attr_accessor :name, :ancestries, :backgrounds, :classes, :description, :statistics
  
  @@all = []
  
  def initialize(name)
    @name = name
    @description = ""
    @@all << self
    @statistics = {
      str: 10,
      dex: 10,
      con: 10,
      int: 10,
      wis: 10,
      cha: 10
    }
  end

  def writer

    puts "Tell your tale."

    description << gets.chomp

  end

  def rewriter
    
    description.clear

  end

  def self.all
    @@all
  end

end