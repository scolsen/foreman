module Motherlode
  class Lode
    getter results  : Array(Payload),
           computed : Payload | Nil
    
    @chips = [] of Chip.class
    @results = [] of Payload 
    @computed = nil

    property chips 
    getter command
    def initialize(@command : Symbol, @chips : Array(Chip.class))
    end
  
    def ==(other : self)
      command == other.command
    end

    def mine()
      @chips.each do | chip |
        @results << chip._execute
      end
    end

    def mine(data : Payload)
      @chips.each do | chip |
        @results << chip._execute(data)
      end
    end

    def compose
      @computed = @chips[0]._execute
      rest = @chips[1..-1]
      
      rest.each do | chip |
        @computed = chip._execute @computed 
      end
    end

    def compose(data : Payload)
      @computed = @chips[0]._execute data
      rest = @chips[1..-1]
      
      rest.each do | chip |
        @computed = chip._execute @computed 
      end
    end
  end
end
