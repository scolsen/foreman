require "option_parser"

module Motherlode
  class Foreman
    getter miners : Hash(String, Miner) | Nil 
    
    def register(miner : Miner)
      @miners[miner.command] = miner 
    end

    def parse
      args = ARGV
      cmd = args.first?
      miners.each do |command, miner|
        if command == cmd
          miner.mine(args.shift)
        end
      end
    end
  end
end
