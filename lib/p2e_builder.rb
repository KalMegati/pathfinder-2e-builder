require_relative "p2e_builder/version"
require_relative "Archivist.rb"
require_relative "Builder.rb"
require_relative "Commander.rb"

class PeBuilder
  def self.program_runner
    start = Commander.new

    start.titlecard
    start.menucard
  end
end
