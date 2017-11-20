def calculate(first, second, operation)
  if operation == "+"
    result = first + second
  elsif operation == "-"
    result = first - second
  elsif operation == "*"
    result = first * second
  elsif operation == "/"
    result = first / second
  else
    result = nil
  end
return result
end
