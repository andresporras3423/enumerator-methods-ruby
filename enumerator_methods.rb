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
      accepted << value if yield value
    end
    accepted
  end

  def my_all?
    return (my_all? { |x| !x.nil? }) unless block_given?

    my_each do |value|
      return false unless yield value
    end
    true
  end

  def my_any?
    return (my_any? { |x| !x.nil? }) unless block_given?

    my_each do |value|
      return true if yield value
    end
    false
  end

  def my_none?
    return (my_none? { |x| !x.nil? }) unless block_given?

    my_each do |value|
      return false if yield value
    end
    true
  end

  def my_count(nval = nil)
    counter = 0
    if !nval.nil?
      my_each do |value|
        counter += 1 if nval == value
      end
    else
      my_each do
        counter += 1
      end
    end
    counter
  end

  def my_map
    return to_enum unless block_given?

    new_array = []
    my_each do |value|
      new_array << (yield value)
    end
    new_array
  end

  def my_inject(nval = nil, nsym = nil, nproc = nil)
    temp_arr = to_a
    params = compareParams([temp_arr[0], :+, proc {}], [nval, nsym, nproc])
    total = nil
    temp_arr.unshift(params[0]) unless params[0].nil?
    return symbolInject(params[1], temp_arr) unless params[1].nil?

    temp_arr.my_each_with_index do |value, index|
      total = if index == 0
        value
      elsif params[2].nil?
        yield total, value
      else
        params[2].call(total, value)
      end
    end
    total
  end

  def symbolInject(param, temp_arr)
    case param
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
    new_params
  end
end
