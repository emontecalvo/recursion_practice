
def deep_clone(arg)
  if arg.is_a?(Array)
    clone = []
    arg.each do |ele|
      clone << deep_clone(ele)
    end
  else
    clone = arg
  end
  clone
end

first = [1, [2], [3, [4]]]

p second = deep_clone(first)

first[2] << "lulu"

second[1] << "tutu"

puts "first"
p first

puts "second"
p second
