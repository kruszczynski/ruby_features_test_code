# Keyword arguments cannot be filled positionally:
def m(foo: 1, bar: 2)
  [foo, bar]
end

method(:m).parameters # => [[:key, :foo], [:key, :bar]]
m # => [1, 2]
m(1, 2) rescue $! # => ArgumentError
m(foo: 2) # => [2, 2]
m(bar: 1) # => [1, 1]
m(foo: 3, bar: 3) # => [3, 3]

# The next version of Ruby will allow mandatory keyword arguments,
# probably in the form of "def m(foo:, bar:)".

# Keyword arguments must come after any positional arguments in
# the parameter list; "def m(foo: 1, bar)" is a syntax error.
# This means that methods accepting keyword arguments cannot use
# the "naked hash" idiom. They should use the new keyword rest
# argument instead:

def m(foo: 1, **opts)
  [foo, opts]
end

method(:m).parameters # => [[:key, :foo], [:keyrest, :opts]]
m(foo: 1, bar: 2) # => [1, {:bar=>2}]
m(bar: 2) # => [1, {:bar=>2}]

# It is ambiguous to pass a naked hash to a method accepting keyword
# arguments:

def m(foo: 1)
  foo
end

method(:m).parameters # => [[:key, :foo]]
m(bar: 2) rescue $! # => ArgumentError

# This still works, though:

def m(foo)
  foo
end

method(:m).parameters # => [[:req, :foo]]
m(bar: 2) # => {:bar=>2}

# We can mix "rest" positional arguments and "rest" keyword arguments.
# The various rules governing both types still apply.
def m(foo, *bar, baz, qux: 1, **opts)
  [foo, bar, baz, qux, opts]
end

method(:m).parameters # => [[:req, :foo], [:rest, :bar], [:req, :baz], [:key, :qux], [:keyrest, :opts]]
m(1, 2, 3, 4, 5, quux: 6) # => [1, [2, 3, 4], 5, 1, {:quux=>6}]
m(1, 2, 3, 4, 5, 6) # => [1, [2, 3, 4, 5], 6, 1, {}]
m(1, 2, qux: 3) # => [1, [], 2, 3, {}]

# Block parameters can use keyword arguments:
def m
  yield bar: 3
end

m do |foo: 1, bar: 2|
  [foo, bar]
end # => [1, 3]

# Putting it all together:

define_method(:m) do |foo, *bar, baz, qux: 1, **opts, &blk; a, b|
  [foo, bar, baz, qux, opts, blk]
end

method(:m).parameters # => [[:req, :foo], [:rest, :bar], [:req, :baz], [:key, :qux], [:keyrest, :opts], [:block, :blk]]
m(1, 2, 3, qux: 4, quux: 5) { } # => [1, [2], 3, 4, {:quux=>5}, #<Proc:0x83bbfc@kwargs.rb:67>]
