module Motherlode
  class Lode
    @_chips = Set(Chip.class).new 
    
    property chips 
    getter command, executor
    def initialize(@command : Symbol, @chips : Array(Chip))
      chips.each do |chip|
        _chips.add(chip)
      end
    end
  
    def ==(other : self)
      command == other.command
    end

    def mine(chipclass : Chip.class)
      _chips.each do |chip|
        return unless chip.class == chipclass 
        if !data.nil?
          chip._execute(data)
        else 
          chip._execute
        end
      end
    end
  end
end
