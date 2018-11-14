# TODO: Write documentation for `Motherlode` module Motherlode
require "./foreman/**"
require "yaml"

module Foreman 
  VERSION = "0.1.0"
  extend self 

  private module ForemanConfig
    def default_config(configuration_options : Array(NamedTuple(option: String, default: String)))
      @has_config = true
      configuration_options.each do | option |
        @config[option[:option]] = option[:default]
      end
    end
  end

    @@miners = {} of String => Miner 
    
    def _execute(code : Int32)
      exit(code)
    end

    def register(miner : Miner)
      @@miners[miner.command] = miner 
    end

    def parse
      args = ARGV
      return if args.first?.nil?
      cmd = args.shift
      exe = uninitialized Miner
      @@miners.each do |command, miner|
        help(args[0]) if cmd == "help"
        if command == cmd
          exe = miner
          break
        end
      end
      _execute(exe.mine(args))
    end
 
    def parse(args : Array(String))
      return if args.first?.nil?
      cmd = args.shift
      exe = uninitialized Miner
      @@miners.each do |command, miner|
        help(args[0]) if cmd == "help"
        if command == cmd
          exe = miner 
          break
        end
      end
      _execute(exe.mine(args))
    end

    def help(comm : String) 
      puts comm
      @@miners.each do |command, miner|
        puts miner.parser if comm == command
      end
      exit 0
    end
end
