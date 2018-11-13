module Foreman
  module ChipInterface
    abstract def execute : Object
    abstract def execute(data : Payload) : Object 
    abstract def fail
  end    

  def compose(chip : Chip.class)
    ->chip._execute
  end

  def compose(f : Proc(Payload), chip : Chip.class)
    ->chip._execute
  end

  abstract class Chip
    extend ChipInterface

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
