module Enumerable
  def my_each
    return to_enum unless block_given?

    x = 0
    array = to_a
    while x < array.length
      yield array[x]
      x += 1
    end
  end
  
  def my_each_with_index
    return to_enum unless block_given?

    x = 0
    array = to_a
    while x < array.length
      yield array[x], x
      x += 1
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
      if (my_all?{|x| x != nil})
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
      if (my_any?{|x| x!= nil})
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
  def my_none?
    if !block_given?
      if (my_none?{|x| x != nil})
        return true
      else
        return false
      end
    end
    my_each do |value|
      if (yield value)
        return false
      end
    end
    return true
  end
  def my_count(nVal = nil)
    counter=0
    if nVal!=nil
      my_each do |value|
        counter += 1 if (nVal == value)
      end
    else 
      my_each do |value|
        counter += 1
      end
    end
    return counter
  end
  def my_map
    return to_enum unless block_given?
    new_array = []
    my_each do |value|
      new_array << (yield value)
    end
    return new_array
  end
  def my_inject(nVal = nil, nSym = nil, nProc = nil)
    temp_arr = to_a
    params = compareParams([temp_arr[0], :+, proc{}],[nVal, nSym, nProc])
    total=nil
    temp_arr.unshift(params[0]) if params[0]!=nil
    if params[1]!=nil
      case params[1]
      when :+
        return temp_arr.my_inject {|total, a| total + a}
      when :-
        return temp_arr.my_inject {|total, a| total - a}
      when :*
        return temp_arr.my_inject {|total, a| total * a}
      when :/
        return temp_arr.my_inject {|total, a| total / a}
      when :**
        return temp_arr.my_inject {|total, a| total ** a}
      when :&
        return temp_arr.my_inject {|total, a| total && a}
      when :|
        return temp_arr.my_inject {|total, a| total || a}
      end
    end
    temp_arr.my_each_with_index do |value, index|
      if index != 0
        if params[2] != nil
          total = params[2].call(total, value)
        else
          total = yield total, value
        end
      else
        total = value
      end
    end
    return total
  end
  def compareParams(types, params)
    new_params= Array.new(types.length, nil) 
    i=types.length-1
    while i >= 0
      j = 0
      while j < params.length
        if types[i].class == params[j].class
          new_params[i] = params[j]
          break
        end
        j += 1
      end
      i -= 1
    end
    return new_params
  end
end
