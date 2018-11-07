module Motherlode
  module ChipInterface
    abstract def execute
    abstract def execute(data : Object)
    abstract def compose(chip : Chip.class, data : Object)
    abstract def fail
  end

  abstract class Chip
    extend ChipInterface

    def compose(chip : Chip.class)
      execute(chip._execute) 
    end
    
    def self.==(other : self)
      self.class == other.class
    end

    def self._execute
      begin 
        execute
      rescue
        fail
      end
    end

    def self._execute(data : Object)
      begin 
        execute(data)
      rescue
        fail
      end
    end
  end
end
