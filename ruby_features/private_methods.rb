class Foo
  # ruby 2.0
  def public
  end

  def private_1
  end

  private :private_1

  private

  def private_2
  end
end

class Foo
  # ruby 2.1
  def public
  end

  private def private_1
  end

end
