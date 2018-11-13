require "./src/foreman"

class MyMiner < Foreman::Miner
  def execute(data : Array(String))
    puts "Hello world."
    puts get_option("nil")
    puts @options
    puts Foreman.config
  end
end

min = MyMiner.new("test")
min.option("n", "nil", "Returns nil.") 

config = [{option: "test", default: "foo"},
          {option: "other", default: "bar"}]

Foreman.default_config(config)
Foreman.register(min)
Foreman.parse

puts Dir.current
