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
      lode.chips.should be_a(Array(Motherlode::Chip.class)) 
    end

    it "Should execute all chips." do
      lode.mine()
      puts lode.results
      lode.results.should be_a(Array(Motherlode::Payload))
    end

    it "Should compose executions." do
      lode.compose
      puts lode.computed
      lode.computed.should be_a(Motherlode::Payload)
    end
  end

  describe "Foreman" do
    lode = Motherlode::Lode.new(:mylode, [Motherlode::NilChip, Motherlode::FalseChip, Motherlode::NilChip])
    f = Motherlode::Foreman.new(:test, {:dog => lode})
    it "Should convert simples to payloads." do
      f.to_payload(nil).should be_a(Motherlode::Payload) 
    end
  end
end
