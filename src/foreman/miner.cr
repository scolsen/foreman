require "option_parser"

module Foreman
  abstract class Miner
    getter parser  : OptionParser,
           command : String,
           options : Hash(String, String | Bool),
           free_args : Array(String)

    
    abstract def execute(values : Array(String)) : Int32

    private def make_opt(short : String, long : String, arg : String)
      sopt = "-"  + short.strip
      sopt = sopt + arg.upcase
      lopt = "--" + long.strip
      lopt = lopt + arg.upcase
      return {sopt, lopt}
    end
    
    private def make_opt(short : String, long : String)
      sopt = "-"  + short.strip
      lopt = "--" + long.strip
      return {sopt, lopt}
    end

    private def set_option(opt : String, val : String | Bool)
      options[opt] = val
    end
    
    def mine(args)
      @parser.parse(args)
      execute @free_args
    end

    def get_option(opt : String)
      return if @options[opt]?.nil?
      @options[opt]
    end
       
    def option(short : String, long : String, description : String, arg : String)
      opts = make_opt(short, long, arg)
      parser.on(opts[0], opts[1], description) do | data |
        if data.empty?
          set_option(long, true)
        else  
          set_option(long, data)
        end
      end
    end

    def option(short : String, long : String, description : String)
      opts = make_opt(short, long)
      parser.on(opts[0], opts[1], description) do | data |
        if data.empty?
          set_option(long, true)
        else  
          set_option(long, data)
        end
      end
    end

    def initialize(@command : String)
      @free_args = [] of String
      @options = {} of String => String | Bool
      @parser = OptionParser.new
      @parser.unknown_args do | data |
        @free_args = data
      end
      @parser.missing_option do | data |
        puts "Option #{data} is missing an argument." 
        exit 1
      end
      @parser.invalid_option do | data |
        puts "Invalid option: #{data}"
        exit 1
      end
    end
  end
end
