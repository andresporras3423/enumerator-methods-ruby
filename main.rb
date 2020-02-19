require './enumerator_methods'

def multiply_els(arr)
  rand_method = rand(1..3)
  case rand_method
  when 1 #by block
    puts arr.my_inject {|total, a| total * a}
  when 2 #by symbol
    puts arr.my_inject(:*)
  when 3 #by proc
    by_proc = proc {|total, a| total * a}
    puts arr.my_inject (by_proc)
  end
end

lista = ["hamburguer","pizza","hot dog","hamburguer","sushi"]
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
multiply_els([2,4,5])
# string1='EXAMPLE MY_EACH'
# string1+="\nI want a hamburguer"
# string1+="\nI want a pizza"
# string1+="\nI want a hot dog"
# string1+="\nI want a hamburguer"
# string1+="\nI want a sushi"
# string1+="\nEXAMPLE MY_EACH_WITH_INDEX"
# string1+="\nproduct number 1 is: hamburguer"
# string1+="\nstring1+=product number 2 is: pizza"
# string1+="\nproduct number 3 is: hot dog"
# string1+="\nproduct number 4 is: hamburguer"
# string1+="\nproduct number 5 is: sushi"
# string1+="\nEXAMPLE MY_SELECT"
# string1+="\n2"
# string1+="\n4"
# string1+="\n6"
# string1+="\nEXAMPLE MY_ALL?"
# string1+="\ntrue"
# string1+="\nEXAMPLE ANY?"
# string1+="\nfalse"
# string1+="\nEXAMPLE NONE?"
# string1+="\ntrue"
# string1+="\nEXAMPLE MY_COUNT"
# string1+="\n2"
# string1+="\nEXAMPLE MY_MAP"
# string1+="\nhamburguer hamburguer"
# string1+="\npizza pizza"
# string1+="\nhot dog hot dog"
# string1+="\nhamburguer hamburguer"
# string1+="\nsushi sushi"
# string1+="\nEXAMPLE MY_INJECT"
# string1+="\n-35"
# string1+="\n-28"
# string1+="\n-28"
# string1+="\n-28"
# string1+="\n-35"
# string1+="\n-35"
# string1+="\n-35"
# string1+="\nEXAMPLE MULTIPLY_ELS"
# string1+="\n40"
# puts string1
