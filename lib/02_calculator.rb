# 02_calculator.rb

def add(a, b)
    a + b
  end
  
  def subtract(a, b)
    a - b
  end
  
  def sum(numbers)
    numbers.inject(0, :+)
  end
  
  def multiply(a, b)
    a * b
  end
  
  def power(a, b)
    a ** b
  end
  
  def factorial(n)
    (1..n).reduce(1, :*)
  end
  