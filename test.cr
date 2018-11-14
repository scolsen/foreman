require "./src/foreman"

class MyMiner < Foreman::Miner
  def execute(data : Array(String))
    puts "Hello world."
    puts get_option("nil")
    puts @options
    return 0
  end
end

min = MyMiner.new("test")
min.option("n", "nil", "Returns nil.") 

config = [{option: "test", default: "foo"},
          {option: "other", default: "bar"}]

Foreman.register(min)
Foreman.parse
