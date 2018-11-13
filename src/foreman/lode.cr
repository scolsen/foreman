module Foreman
  class Lode
    @chips = [] of Chip.class

    property chips 
    def initialize(@chips : Array(Chip.class))
    end
  
    def ==(other : self)
      command == other.command
    end

    def compute : Payload
      computed = @chips[0]._execute
      rest = @chips[1..-1]
      
      rest.each do | chip |
        computed = chip._execute computed 
      end

      computed
    end

    def compute_with(data : String | Array(String)) : Payload
      computed = @chips[0]._execute Payload.new(data)
      rest = @chips[1..-1]
      
      rest.each do | chip |
        computed = chip._execute computed 
      end

      computed
    end
  end
end
