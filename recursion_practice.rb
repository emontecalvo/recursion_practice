# 1. Write a recursive method, range, that takes a start
 # and an end and returns an array of all numbers between.
 # If end < start, you can return the empty array.

def range(start, ending)
  return [] if start >= ending - 1
  # retu_arr = []
  # retu_arr << start + 1
  # retu_arr.concat(range(start+1, ending))
  array = range(start+1, ending)
  array.unshift(start+1)
end

# x = range(1, 10)
# p x


 # 2. Write both a recursive and iterative version
 # of sum of an array.

def sum_an_array(arr)
  p arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  # first = arr[0]
  # rest = sum_an_array(arr[1..-1])
  # total = first + rest
  left = arr[0...arr.length/2]
  right = arr[arr.length/2..-1]
  p left
  p right
  left_sum = sum_an_array(left)
  right_sum = sum_an_array(right)
  total = left_sum + right_sum
end

# y = sum_an_array([5, 3, 4, 1, 2]) # => 15
# p y

# base ** num
def exponent1(base, num)
  return 1 if num == 0
  return base if num == 1
  x = base * exponent1(base, num-1)

end

# exp_test = exponent1(2, 10)
# p exp_test

# def exponent2(base, num)
#   return 1 if num == 0
#   return base if num == 1
#   if num % 2 == 0
#     x = base * (exponent2(base, (num-1)))
#   else
#     x = base * (exponent2(base, (num-1)/2))
#     x * x
#   end

# end

# exp_test2 = exponent2(2,10)
# p exp_test2


def fibonacci_num(num)
    return 0 if num == 0
    return 1 if num == 1
    return 1 if num == 2
    fib_num = (fibonacci_num(num - 1)) + (fibonacci_num(num - 2))
end

def fib_array(count_of_fib_num)
  return [] if count_of_fib_num == 0
  fib_array = [fibonacci_num(count_of_fib_num)]
  fib_array += fib_array(count_of_fib_num - 1)

end

# fib_test = fibonacci_num(6)
# p fib_test

# fib_test2 = fib_array(6)
# p fib_test2


class Array

  def deep_dup
    retu_arr = []
     self.each do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        retu_arr << el
      end
    end

  end
end

# bb = [3, 4 [45], ["abc", "cd",[2, 1]], 42].deep_dup
# p bb


def bsearch(arr, target)
  return nil if arr.empty?
  middle_idx = (arr.length/2) # odd_arrays = direct middle, even arrays = HIGHER MIDDLE
  if arr[middle_idx] == target
    return middle_idx
  elsif arr[middle_idx] > target
    bsearch(arr[0...middle_idx], target)
  else
    idx = bsearch(arr[(middle_idx+1)..-1], target)
    if idx.is_a?(Fixnum)
      idx + middle_idx + 1
    else
      nil
    end
  end
end


# btest = bsearch([1, 2, 3, 4, 5, 6, 7, 8], 3)
# btest2 = bsearch([3, 4, 5, 7, 11], 7)
# p btest
# p btest2



def subsets(set)
  return [[]] if set.empty?
  smaller_set = set.take(set.count-1)
  smaller_subsets = subsets(smaller_set)
  bigger_subsets = []
  smaller_subsets.each do |smaller_subset|
    bigger_subsets << smaller_subset + [set.last]
  end

  smaller_subsets + bigger_subsets
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

class Array
  def subsets
    return [[]] if empty?
    subs = take(count - 1).subsets
    subs.concat(subs.map { |sub| sub + [last] })
  end
end





















