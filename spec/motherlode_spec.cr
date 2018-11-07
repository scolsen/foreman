require "./spec_helper"

describe Motherlode do
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
  
  describe "Lode" do
    lode = Motherlode::Lode.new(:mylode, [Motherlode::NilChip, Motherlode::FalseChip, Motherlode::NilChip])
    it "Should initialize with a set of chips." do
      puts lode.chips
      lode.chips.should be_a(Set(Motherlode::Chip.class)) 
    end

    it "Should execute a given chip." do
      lode.mine(Motherlode::NilChip).should be_nil
    end
  end
end
