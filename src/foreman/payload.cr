module Foreman
  alias Simple = Nil | Bool | String | Char | Symbol | Int32 | Array(String)
  alias SimpleClass = Nil.class | Bool.class | String.class | Char.class | Symbol.class | Int32.class | Array(String).class
  
  struct Payload
    getter chip : Chip.class | Nil,
           type : SimpleClass,
           data : Simple
    
    def initialize(@data : Simple, @chip : Chip.class | Nil)
      @type = @data.class 
    end

    def initialize(@data : Simple)
      @type = @data.class 
      @chip = nil
    end
  end
end
