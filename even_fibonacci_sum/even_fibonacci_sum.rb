def even_fibonacci_sum(a, b, max_value = 4_000_000)
  sum = 2
  
  while (b < max_value)
    c = a + b
    
    if (c % 2 == 0) then
      sum += c
    end
    
    a = b
    b = c
  end
  
  return sum
end

def main
  puts even_fibonacci_sum(1, 2)
end

main
