# TODO: Write documentation for `Motherlode` module Motherlode
module Motherlode 
  VERSION = "0.1.0"
  extend self
  
  @@lodes = nil
  
  def register(lode : Lode) 
    @@lodes << lode
  end

  class Lode
    getter command, executor
    def initialize(@command : String, @executor : Executor)
    end

    def ==(other : self)
      command == other.command && executor == other.executor
    end
  end

  abstract class Executor
    def ==(other : self) 
      self.class == other.class
    end

    abstract def execute
  end

  class NilExecutor < Executor
    def execute
      return nil
    end
  end

  class FalseExecutor < Executor
    def execute
      false
    end
  end

end
