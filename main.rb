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

lista = ["hamburguer", "pizza", "hot dog", "hamburguer", "sushi"]
puts 'EXAMPLE MY_EACH'
lista.my_each do |lis|
  puts "I want a #{lis}"
end
puts 'EXAMPLE MY_EACH_WITH_INDEX' 
lista.my_each_with_index { |n, i| puts "product number #{i+1} is: #{n}" }
puts 'EXAMPLE MY_SELECT' 
puts [1,2,3,4,5,6].my_select { |n| n % 2 == 0 }
puts 'EXAMPLE MY_ALL?' 
puts lista.my_all?{|x| x.length > 3}
puts 'EXAMPLE ANY?' 
puts [nil, nil].my_any?
puts 'EXAMPLE NONE?' 
puts [lista].none?{|x| x == "pizzas"}
puts 'EXAMPLE MY_COUNT' 
puts lista.my_count("hamburguer")
puts 'EXAMPLE MY_MAP' 
puts lista.my_map{|x| x+" "+x}
puts 'EXAMPLE MY_INJECT' 
puts (5..10).my_inject { |sum, n| sum - n } 
c =  proc { |sum, n| sum - n } 
puts (6..10).my_inject(c)
puts (6..10).my_inject{ |sum, n| sum - n } 
puts (6..10).my_inject(:-)
puts (6..10).my_inject(5,c)
puts (6..10).my_inject(5){ |sum, n| sum - n } 
puts (6..10).my_inject(5,:-)
puts 'EXAMPLE MULTIPLY_ELS' 
puts multiply_els([2,4,5])
