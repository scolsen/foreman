# TODO: Write documentation for `Motherlode` module Motherlode
require "./foreman/**"

module Foreman 
  VERSION = "0.1.0"
  extend self
    @@miners = {} of String => Miner 

    def register(miner : Miner)
      @@miners[miner.command] = miner 
    end

    def parse
      args = ARGV
      cmd = args.first?
      @@miners.each do |command, miner|
        args.shift
        help(args.shift) if cmd == "help"
        if command == cmd
          miner.mine(args)
        end
      end
    end
 
    def parse(args : Array(String))
      cmd = args.first?
      @@miners.each do |command, miner|
        args.shift
        help(args.shift) if cmd == "help"
        if command == cmd
          miner.mine(args)
        end
      end
    end

    def help(comm : String) 
      puts comm
      @@miners.each do |command, miner|
        puts miner.parser if comm == command
      end
      exit 0
    end

  class NilChip < Chip
    def self.execute
      nil 
    end

    def self.execute(data) 
      nil 
    end
    
    def self.fail
      nil
    end
  end

  class FalseChip < Chip
    def self.execute
      false
    end

    def self.execute(data) 
      false
    end

    def self.fail
      false
    end
  end
end
