require "./spec_helper"

describe Foreman do
  describe "Chip" do
    it "Generates modules that equal themselves and do not equal others." do
      t = Foreman::NilChip == Foreman::NilChip 
      t.should be_true
      f = Foreman::NilChip == Foreman::FalseChip
      f.should be_false
    end

    it "Can execute with no arguments." do
      ex = Foreman::NilChip._execute
      ex.should be_a(Foreman::Payload)
      ex.data.should be_nil
      ex.type.should eq(Nil)
      ex.chip.should eq(Foreman::NilChip)
    end

    it "Can execute with arguments." do
      ex = Foreman::NilChip._execute(Foreman::Payload.new(nil, Foreman::NilChip))
      ex.should be_a(Foreman::Payload)
      ex.data.should be_nil
      ex.type.should eq(Nil)
      ex.chip.should eq(Foreman::NilChip)
    end
  end
  
  describe "Lode" do
    lode = Foreman::Lode.new([Foreman::NilChip, Foreman::FalseChip, Foreman::NilChip])
    it "Should initialize with a set of chips." do
      puts lode.chips
      lode.chips.should be_a(Array(Foreman::Chip.class)) 
    end

    it "Should execute all chips." do
      lode.compute.should be_a(Foreman::Payload)
    end
  end

  describe "Miner" do
    lode = Foreman::Lode.new([Foreman::NilChip, Foreman::FalseChip, Foreman::NilChip])
    min = Foreman::Miner.new("test")
    
    it "Should add a load associated with an option." do
      min.add("-n", "--nil", "Returns nil", lode) 
      min.mine(["-n", "", ""])
      min.results.should be_a(Array(Foreman::Payload))
      puts min.results
    end
  end

  describe "Foreman" do
  lode = Foreman::Lode.new([Foreman::NilChip, Foreman::FalseChip, Foreman::NilChip])
    min = Foreman::Miner.new("test")
    min.add("-n", "--nil", "Returns nil.", lode) 

    it "Should register a miner." do
      Foreman.register(min)
      Foreman.parse(["test", "-n", "fool"])
      min.results.should be_a(Array(Foreman::Payload))
    end

    it "Should print help." do
      Foreman.register(min)
      Foreman.parse(["help", "test"])
    end
  end
end
