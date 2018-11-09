require "./motherlode/*"

module Motherlode::Util
  class InspectorChip < Motherlode::Chip
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
