module Motherlode

  abstract struct Option
    getter option : String | Nil,
           mode : Symbol | Nil
  end

  struct Flag < Option
    @mode = :Flag

    def initialize(@option : String)
    end
  end

  struct Opt < Option
    @mode = :Opt

    def initialize(@option : String)
    end
  end
end
