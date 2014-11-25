require './refinements.rb'

class Test
  def string_party
    "string".bartek
  end
end

test = Test.new

# => 'bartek'
# => 'bartek_other'

puts test.string_party
# => `string_party': undefined method `bartek' for "string":String (NoMethodError)
