module Motherlode
  abstract class Executor
      def ==(other : self) 
        self.class == other.class
      end
  
      abstract def execute
  end
end
