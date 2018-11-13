require "./foreman/*"

module Foreman::Util
  class InspectorChip < Foreman::Chip
    def execute
      "No payload inspected." 
    end

    def execute(data)
      "Inspected #{data} with data: #{data.data}, 
       type: #{data.type}, chip: #{data.chip}"
    end
    
    def fail
      "Inspector chip failed."
    end
  end
end
