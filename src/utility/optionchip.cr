module Foreman::Util
  class BooleanOptionChip < Foreman::OptionChip
    def execute
      return false
    end

    def execute(data : Payload)
      return data.data if data.data.is_a?(Bool)
      return false
    end

    def fail 
      return 1
    end
  end

  class NilOptionChip < Foreman::OptionChip
    def execute
      return nil
    end

    def execute(data : Payload)
      return data.data unless data.data.is_nil?
      return nil
    end

    def fail 
      return 1
    end
  end
end
