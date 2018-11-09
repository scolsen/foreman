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

    def mine(chipset : Array(Chip.class))
      targets = chipset.select { |x| @chips.includes? x }
      targets.each do | target |
        target._execute
      end
    end

  end
end
