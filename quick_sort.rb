

def quick_sort(arr)
  return [] if arr.empty?
  return arr if arr.length == 1
  left = []
  right = []
  arr.each do |el|
    if el < arr[0]
      left << el
    elsif el > arr[0]
      right << el
    end
  end
  left = quick_sort(left)
  right = quick_sort(right)
  left << arr[0]
  left.concat(right)
end



x = quick_sort([4, 5, 2, 7, 13, 10, 1, 13]) #=> [1, 2, 4, 5, 7, 10, 13]
p x