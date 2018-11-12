module Motherlode
  abstract class ForemanChip < Chip
  end 
  
  abstract class Foreman
    getter command : String, 
           context : Array(String),
           selected : Lode | Nil
    
    @lodes = {} of String => Lode 
    @context = [] of String
    @options = [] of Option
    @selected = nil

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
   
    def select_lode 
      @lodes.each do | k, v|
        @selected = v if k == @context[0]
      end
    end

    def run(args : Array(String))
    end

    def initialize(@command : String, @lodes : Hash(String, Lode))
    end
  end
end
