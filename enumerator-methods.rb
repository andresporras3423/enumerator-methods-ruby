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
  def my_each_with_index
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
      yield array[x], x
      x+=1
    end
  end
  def my_select
    return to_enum unless block_given?
    accepted = []
    my_each do |value|
      if yield value
        accepted << value
      end
    end
    return accepted
  end
  def my_all?
    if !block_given?
      if (my_all?{|x| x!=nil})
        return true
      else
        return false
      end
    end
    my_each do |value|
      if !(yield value)
        return false
      end
    end
    return true
  end
  def my_any?
    if !block_given?
      if (my_any?{|x| x!=nil})
        return true
      else
        return false
      end
    end
    my_each do |value|
      if (yield value)
        return true
      end
    end
    return false
  end
end
