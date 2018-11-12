module Motherlode
  abstract class ForemanChip < Chip
  end

  class Foreman
    getter command
    @lodes = {} of Symbol => Lode
    
    def ==(other : self)
      @command == other.command
    end

    def to_payload(data : Simple)
      Payload.new(data, ForemanChip)
    end
  
    def on_results(command : Symbol)
      @lodes[command].mine
      yield @lode[command].results
    end
  
    def on_results(command : Symbol, data : Simple)
      @lodes[command].mine to_payload(data)
      yield @lode[command].results
    end
  
    def on_computed(command : Symbol)
      @lodes[command].compose
      yield @lodes[command].computed
    end
  
    def on_computed(command : Symbol, data : Simple)
      @lodes[command].compose to_payload(data)
      yield @lodes[command].computed
    end
    
    def run(Array(String))

    end

    def initialize(@command : String, @lodes : Hash(Symbol, Lode))
    end
  end
end
