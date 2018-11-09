module Motherlode
  class Lode
    @chips = Set(Chip.class).new 

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
        chip._execute
      end
    end
    
    def mine(chipclass : Chip.class, data : Object)
      @chips.each do |chip|
        return unless chip.class == chipclass 
        chip._execute(data)
      end
    end
  end
end
