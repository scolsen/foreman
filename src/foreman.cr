# TODO: Write documentation for `Motherlode` module Motherlode
require "./foreman/**"
require "yaml"

module Foreman 
  VERSION = "0.1.0"
  extend self
    PROGRAM_NAME = "foreman"
    @@miners = {} of String => Miner 
    @@config = {} of String => String 
    @@has_config = false

    def config 
      @@config
    end

    def default_config(configuration_options : Array(NamedTuple(option: String, default: String)))
      @@has_config = true
      configuration_options.each do | option |
        @@config[option[:option]] = option[:default]
      end
    end

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
end
