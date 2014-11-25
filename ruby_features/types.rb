a = 1 # the type of a is now Integer

def foo(x)
  x.to_int  # now all x must have .to_int
end

foo(1)   # OK
foo('a') # no good! doesn't have to_int!
