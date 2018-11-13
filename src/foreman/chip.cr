module Foreman
  module ChipInterface
    abstract def execute : Object
    abstract def execute(data : Payload) : Object 
    abstract def fail
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

abstract class OptionChip 
  extend ChipInterface 

  def self._execute(reciever : Simple) : Payload
      begin 
        p = Payload.new(execute, self)
        reciever = p.data
        p  
      rescue
        reciever = Payload.new(fail, self).data
      end
    end

    def self._execute(data : Payload, reciever : Simple) : Payload
      begin 
        p = Payload.new(execute, self)
        reciever = p.data
        p
      rescue
        reciever = Payload.new(fail, self).data
      end
    end
end

  abstract class IOChip
    extend ChipInterface
    
    def self._execute : Payload
      begin 
        execute
        Payload.new(nil, self)
      rescue
        Payload.new(fail, self)
      end
    end

    def self._execute(data : Payload) : Payload
      begin 
        execute(data)
        Payload.new(nil, self)
      rescue
        Payload.new(fail, self)
      end
    end
  end

  abstract class ConditionalChip
    extend ChipInterface

    def self._execute : Payload
      begin 
        Payload.new(execute, self)
      rescue
        Payload.new(fail, self)
      end
    end

    def self._execute(data : Payload) : Payload
      begin 
        Payload.new(execute(data), self) if has_chip? data
      rescue
        Payload.new(fail, self)
      end
    end
  end
end
