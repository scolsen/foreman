module Motherlode
  class Lode
      getter command, executor
      def initialize(@command : Symbol, @executor : Executor)
      end
  
      def ==(other : self)
        command == other.command && executor == other.executor
      end
  end
end
