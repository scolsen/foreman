require "./src/foreman"

lode = Foreman::Lode.new([Foreman::NilChip, Foreman::FalseChip, Foreman::NilChip, Foreman::Util::BooleanOptionChip])

min = Foreman::Miner.new("test")
min.add("-n", "--nil", "Returns nil.", lode) 
min.default(lode)

Foreman.register(min)
Foreman.parse

