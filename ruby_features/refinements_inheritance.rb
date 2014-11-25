require './refinements_parent'

class Test < BaseTest
  def initialize
    puts "test".bartek_other
  end
end

Test.new
# => undefined method `bartek_other' for "test":String (NoMethodError)
