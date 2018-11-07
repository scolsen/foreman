# TODO: Write documentation for `Motherlode` module Motherlode
require "./motherlode/**"

module Motherlode 
  VERSION = "0.1.0"
  extend self

  @@lodes = Set(Lode).new
  
  def register(lode : Lode) 
    @@lodes << lode
  end

  class NilChip < Chip
    def self.execute
      nil 
    end

    def self.execute(data) 
      nil 
    end
    
    def self.compose(chip, data)
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

    def self.compose(chip, data)
      false
    end

    def self.fail
      false
    end
  end
end
