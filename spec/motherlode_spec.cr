require "./spec_helper"

describe Motherlode do
  # TODO: Write tests

  describe "Chip" do
    it "Generates modules that equal themselves and do not equal others." do
      t = Motherlode::NilChip == Motherlode::NilChip 
      t.should be_true
      f = Motherlode::NilChip == Motherlode::FalseChip
      f.should be_false
    end

    it "Can execute with no arguments." do
      Motherlode::NilChip._execute.should be_nil
    end

    it "Can execute with arguments." do
      Motherlode::NilChip._execute("a").should be_nil
    end
  end
  
#  describe "NilExecutor" do
#    it "Returns nil." do
#      eg = Motherlode::NilExecutor.new
#      eg.execute(NamedTuple.new).should be_nil
#    end
#
#    it "Instances are equal." do
#      eg = Motherlode::NilExecutor.new
#      ie = Motherlode::NilExecutor.new
#      te = eg == ie
#      te.should be_true
#    end
#  end
#
#  describe "Lode" do
#    lode = Motherlode::Lode.new(:lode, Motherlode::NilExecutor.new)
#    lode_two = Motherlode::Lode.new(:lode, Motherlode::NilExecutor.new)
#    lode_three = Motherlode::Lode.new(:lode, Motherlode::FalseExecutor.new)
#    lode_four = Motherlode::Lode.new(:doop, Motherlode::FalseExecutor.new) 
#
#    it "Initializes." do
#      lode.should be_a(Motherlode::Lode)
#    end
#  
#    it "Should be equal to itself." do
#      t = lode == lode_two 
#      t.should be_true
#    end
#    
#    it "Should be equal to another lode with a different executor." do
#      t = lode == lode_three
#      t.should be_true
#    end
#    
#    it "Should not be equal to another lode with a different command." do
#      t = lode_four == lode_three
#      t.should be_false
#    end
#  end
end
