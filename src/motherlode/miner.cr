require "option_parser"

module Foreman
  class Miner
    getter parser : OptionParser
    getter command : String
    getter results : Array(Payload)

    def initialize(@command : String)
      @parser = OptionParser.new
      @results = [] of Payload
    end

    def mine(args)
      @parser.parse(args)
    end

    def add(short : String, long : String, description : String, lode : Lode)
      parser.on(short, long, description) do | data |
        unless data.empty?
          @results << lode.compute_with(data)
        else
          @results << lode.compute
        end
      end
    end

    def default(lode : Lode)
      parser.unknown_args do | data |
        unless data.empty?
          @results << lode.compute_with(data)
        else
          @results << lode.compute
        end
      end
    end
  end
end
