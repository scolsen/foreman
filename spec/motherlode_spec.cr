require "./spec_helper"

describe Motherlode do
  # TODO: Write tests

  describe "NilExecutor" do
    it "Returns nil." do
      eg = Motherlode::NilExecutor.new
      eg.execute.should be_nil
    end
  end

end
