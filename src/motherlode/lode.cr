module Motherlode
  class Lode
    @chips = Set(Chip.class).new 
    @data = false 

    property chips 
    getter command
    def initialize(@command : Symbol, @chips : Array(Chip.class))
      _chips = Set(Chip.class).new
      @chips.each do |chip|
        _chips.add(chip)
      end
      @chips = _chips
    end
  
    def ==(other : self)
      command == other.command
    end

    def mine(chipclass : Chip.class)
      @chips.each do |chip|
        return unless chip.class == chipclass 
        if !@data
          chip._execute(@data)
        else 
          chip._execute
        end
      end
    end
  end
end
