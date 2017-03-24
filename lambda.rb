# require './world/init'

# def foo(a, function)
#   function.call(a) + 1
# end
#
#
# anon_foo = ->(x) { x * 2 }
#
# puts foo(10, anon_foo)

# def foo(a, &func)
#   puts func.class
#   func.call(a) + 1
# end
#
# res = foo(10) do |x|
#   x * 2
# end
#
# puts res
#
# def get_countries(flag, data)
#   if flag
#     data.call
#   end
# end
#
# data_load = -> { Country.load! }
#
# get_countries(false, data_load) do
#
# end

def bar()
  puts 'START BAR!'

  # anon_foo = Proc.new do
  #   puts 'START PROC!'
  #
  #   puts 'END PROC!'
  #   return
  # end

  anon_foo = -> do
    puts 'START LAMBDA!'

    puts 'END LAMBDA!'
    return
  end

  anon_foo.call

  puts 'END BAR!'
end




bar
