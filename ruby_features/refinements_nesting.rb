# refinements_nesting.rb

require './bigger_party'

class Test
  using BiggerParty

  def initialize
    puts "test".bigger_bartek
    puts "test".bartek_other
  end
end

Test.new
# => undefined method `bartek_other' for "test":String (NoMethodError)
