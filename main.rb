require './enumerator_methods'

def multiply_els(arr)
  rand_method = rand(1..3)
  case rand_method
  when 1 # by block
    arr.my_inject { |total, a| total * a }
  when 2 # by symbol
    arr.my_inject(:*)
  when 3 # by proc
    by_proc = proc { |total, a| total * a }
    arr.my_inject(by_proc)
  end
end

puts multiply_els([2, 4, 5])
