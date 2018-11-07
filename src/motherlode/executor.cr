module Motherlode
  abstract class Executor
      def ==(other : self) 
        self.class == other.class
      end
  
      abstract def execute(payload : NamedTuple(key: String, val: Object))
  end

  abstract class ComposableExecutor < Executor
    abstract def compose(executor : Executor) 
  end
end
