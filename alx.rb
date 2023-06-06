def fact_one(n)
  if n == 0
    1
  else
    n * fact(n - 1)
  end
end
# 5! 5x4x3x2x1
# puts fact(0)

def fact_two(n)
  acc = 1
  until n == 0
    acc *= n
    n -= 1
  end
  acc
end

puts fact_two(5)