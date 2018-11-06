require "./spec_helper"

describe Motherlode do
  # TODO: Write tests

  describe "NilExecutor" do
    it "Returns nil." do
      eg = Motherlode::NilExecutor.new
      eg.execute.should be_nil
    end

    it "Instances are equal." do
      eg = Motherlode::NilExecutor.new
      ie = Motherlode::NilExecutor.new
      te = eg == ie
      te.should be_true
    end
  end

end
