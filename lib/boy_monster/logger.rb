require 'pp'
module MonsterLibrary
  class Logger
    def initialize(stream = nil)
      @stream = stream || $>
    end
    
    def <<(obj)
      case obj
      when String
        @stream << obj
      else
        PP.pp(obj, @stream, 80)
      end
    end
  end
end