require_relative 'Archivist.rb'

class Builder
  
  attr_accessor :name, :ancestries, :backgrounds, :classes, :description
  
  @@all = []
  
  def initialize(name)
    @name = name
    @description = ""
    @@all << self
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