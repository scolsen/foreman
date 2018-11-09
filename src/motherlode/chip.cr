module Motherlode
  module ChipInterface
    abstract def execute : Object
    abstract def execute(data : Payload) : Object 
    abstract def fail
  end

  abstract class Chip
    extend ChipInterface

    def compose(chip : Chip.class) : Payload
      _execute(chip._execute) 
    end
   
    def compose(chip : Chip.class, data : Payload) : Payload
      _execute(chip._execute(data))
    end

    def self.==(other : self)
      self.class == other.class
    end

    def self._execute : Payload
      begin 
        Payload.new(execute, self)
      rescue
        Payload.new(fail, self)
      end
    end

    def self._execute(data : Payload) : Payload
      begin 
        Payload.new(execute(data), self)
      rescue
        Payload.new(fail, self)
      end
    end
  end
end
