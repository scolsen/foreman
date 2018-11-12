# TODO: Write documentation for `Motherlode` module Motherlode
require "./motherlode/**"

module Motherlode 
  VERSION = "0.1.0"
  extend self

  @@foremen = Set(Foreman).new
  
  def register(foreman : Foreman) 
    @@foremen << foreman
  end

  def select_foreman
    argv = ARGV
    @@foremen.each do | foreman |
      if argv[0] == foreman.command
        foreman.context == argv[1..-1]
        return foreman
      end
    end
  end

  def parse
    select_foreman
      .select_lode
      .prepare
      .run
  end

  class NilChip < Chip
    
    def self.execute
      nil 
    end

    def self.execute(data) 
      nil 
    end
    
    def self.fail
      nil
    end
  end

  class FalseChip < Chip
    
    def self.execute
      false
    end

    def self.execute(data) 
      false
    end

    def self.fail
      false
    end
  end
end
