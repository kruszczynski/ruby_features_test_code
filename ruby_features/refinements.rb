require './party'

module Party
  refine String do
    def bartek
      "bartek"
    end
  end
end

class Test
  using Party

  def initialize
    puts "test".bartek
    puts "test".bartek_other
  end
end
