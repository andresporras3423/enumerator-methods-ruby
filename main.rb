require './enumerator-methods'

def multiply_els(arr)
  rand_method = rand(1..3)
  case rand_method
  when 1 #by block
    puts arr.my_inject {|total, a| total*a}
  when 2 #by symbol
    puts arr.my_inject(:*)
  when 3 #by proc
    by_proc = proc {|total, a| total*a}
    puts arr.my_inject (by_proc)
  end
end

