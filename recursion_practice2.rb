# 1. Write a recursive method, range, that takes a start
#  and an end and returns an array of all numbers between. 
# If end < start, you can return the empty array.


def range(start, ending)
  return [] if start >= ending - 1
  retu_arr = range(start, ending - 1)
  retu_arr << ending - 1
end

#p rangetest = range(1, 10)

# 2. Write both a recursive and iterative version of sum of an array.

def sum(arr)
  return 0 if arr.empty?
  el = arr.shift
  total = sum(arr)
  total + el
end

# p sum_test = sum([3, 2, 4, 1, 5])

def exp1(base, num)
  return 1 if num == 0
  return base if num == 1
  expo = base * exp1(base, num-1)
end

# p exp1_test = exp1(2, 3)
# p exp2_test = exp1(2, 10)

def exp2(base, num)
  return 1 if num == 0
  return base if num == 1
  if num % 2 == 0
    expo = exp(base, num/2)
  else
    expo = exp(base, (num-1)/2)
  end
end

# p exp2_test = exp1(2, 3)
# p exp2_test = exp1(2, 10)

class Array

  def deep_dup
    retu_arr = []
    self.each do |ele|
      if ele.is_a(Array)
        ele.deep_dup
      else
        retu_arr << ele
      end
    end
    retu_arr
  end
end

# p dupp_test = [1, 2, [45, 23, [11], "cat"], [3, "dog"], 901]


def fib_num(num)
  return 1 if num == 1
  return 1 if num == 2
  retu_num = fib_num(num-1) + fib_num(num-2)
end

def fib_arr(fib_num_count)
  return [1] if fib_num_count == 1
  return [1, 1] if fib_num_count == 2

  retu_arr = [fib_num(fib_num_count)]
  retu_arr += fib_arr(fib_num_count - 1)

end

# p fibby_test = fib_arr(6)

def bsearch(array, target)
  return nil if array.empty?

  middle_idx = array.length / 2
  if array[middle_idx] == target
    return middle_idx
  elsif array[middle_idx] > target
    bsearch(array[0...middle_idx], target)
  else
    result = bsearch(array[(middle_idx+1)..-1], target)
    if result.is_a?(Fixnum)
      result + middle_idx + 1
    else
      nil
    end
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
  return [] if array.empty?
  return array if array.count == 1
  retu_arr = []
  left = array[0...(array.length/2)]
  right = array[(array.length/2)..-1]
  left_sort = merge_sort(left)
  right_sort = merge_sort(right)
  
  puts "left sort is #{left_sort}"
  puts "right sort is #{right_sort}"
  
  while left_sort.empty? == false && right_sort.empty? == false
    if left_sort.first < right_sort.first
      retu_arr << left_sort.shift
    else
      retu_arr << right_sort.shift
    end
  end
  if left_sort.empty? == false
    retu_arr.concat(left_sort)
  elsif right_sort.empty? == false
    retu_arr.concat(right_sort)
  end
  puts "retu arr is : #{retu_arr}"
  retu_arr

end

p merge_test = merge_sort([5, 2, 7, 1, 90, 10])

