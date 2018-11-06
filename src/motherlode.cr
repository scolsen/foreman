# TODO: Write documentation for `Motherlode`
module Motherlode
  VERSION = "0.1.0"
  extend self
  
  @@lodes = Set(Lode).new
  
  def register(lode : Lode) 
    @@lodes << lode
  end

  def mine(lode : Lode)
    lode.executor.execute
  end
  
  class Lode
    def initialize(@command : String, executor : Executor(T)) forall T
    end

    def ==(other)
      return @command == other.command && @executor == other.executor
    end
  end

  abstract class Executor(T)
    def initialize(@reciever : T)
    end
   
    def self.==(other) 
      return @reciever == other.reciever 
    end

    abstract def execute
  end

  class NilExecutor < Executor(Nil)
    def initialize()
      super(nil)
    end
    
    def execute
      return nil
    end
  end

end
