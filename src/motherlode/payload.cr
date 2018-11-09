module Motherlode
  alias Simple = Nil | Bool | String | Char | Symbol | Int32
  alias SimpleClass = Nil.class | Bool.class | String.class | Char.class | Symbol.class | Int32.class
  
  class Payload
    getter chip : Chip.class,
           type : SimpleClass,
           data : Simple
    
    def initialize(@data : Simple, @chip : Chip.class)
      @type = @data.class 
    end
  end
end
