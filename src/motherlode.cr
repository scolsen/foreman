# TODO: Write documentation for `Motherlode` module Motherlode
require "./motherlode/**"

module Motherlode 
  VERSION = "0.1.0"
  extend self

  @@lodes = Set(Lode).new
  
  def register(lode : Lode) 
    @@lodes << lode
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
