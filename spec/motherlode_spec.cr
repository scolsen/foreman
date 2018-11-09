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
      ex = Motherlode::NilChip._execute
      ex.should be_a(Motherlode::Payload)
      ex.data.should be_nil
      ex.type.should eq(Nil)
      ex.chip.should eq(Motherlode::NilChip)
    end

    it "Can execute with arguments." do
      ex = Motherlode::NilChip._execute(Motherlode::Payload.new(nil, Motherlode::NilChip))
      ex.should be_a(Motherlode::Payload)
      ex.data.should be_nil
      ex.type.should eq(Nil)
      ex.chip.should eq(Motherlode::NilChip)
    end
  end
  
  describe "Lode" do
    lode = Motherlode::Lode.new(:mylode, [Motherlode::NilChip, Motherlode::FalseChip, Motherlode::NilChip])
    it "Should initialize with a set of chips." do
      puts lode.chips
      lode.chips.should be_a(Set(Motherlode::Chip.class)) 
    end

    it "Should execute a given chip." do
      lode.mine([Motherlode::NilChip, Motherlode::FalseChip]).should be_nil
    end
  end
end
