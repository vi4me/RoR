class OneDivisionError < ZeroDivisionError;end
# begin
#   param = 1
#   raise OneDivisionError, '213123' if param == 1
#   1 / param
# rescue OneDivisionError => e
#   puts 'OneDivisionError'
# rescue ZeroDivisionError => e
#   puts 'ZeroDivisionError'
# rescue NoMethodError => e
# rescue StandardError => e
#   puts 'StandardError'
# end


def foo(x, y)
  x / y
  # ..
rescue ZeroDivisionError => e
  0
end

def bar(x)
  foo(10, x)
end

puts bar(0)
