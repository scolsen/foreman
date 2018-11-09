module Motherlode 
  abstract class Bundler
    abstract def bundle(*payloads : Payload) 
  end
end
