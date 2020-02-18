module Enumerable
  def my_each
    return to_enum unless block_given?
    x=0
    array = nil
    self_class = self.class
    if self_class == Array
      array = self
    else
      array = to_a
    end
    while x < array.length
      yield array[x]
      x+=1
    end
  end
end
