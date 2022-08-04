require 'benchmark'

def selection_sort(arr)
  # type your code in here
  output = []
  while arr.length > 0
  min = arr.min
  y = arr.index(min)
  output << min
  arr.delete_at(y)
  end
  output 
end

def selection_sort1(array)
  # type your code in here
  n = array.length - 1
  n.times do |i|
    min_index = i
    for j in (i + 1)..n
      min_index = j if array[j] < array[min_index]
    end
    array[i], array[min_index] = array[min_index], array[i] if min_index != i
  end
  array 
end



if __FILE__ == $PROGRAM_NAME
  puts "Expecting: [-1, 2, 3, 5]"
  print "=> "
  print selection_sort([3, -1, 5, 2])
  puts Benchmark.measure {
    selection_sort([3, -1, 5, 2])
  }
  print selection_sort1([3, -1, 5, 2])
  puts Benchmark.measure {
      selection_sort1([3, -1, 5, 2])
  }
  puts 

  # Don't forget to add your own!
  # BENCHMARK HERE, you can print the average runtime
  long_input = []
  100.times { long_input << rand }

  startTime = Time.now

  1000.times do
    selection_sort([3, -1, 5, 2])
    selection_sort(long_input)
  end 

  averageTime = (Time.now - startTime) / 2000
  puts "Example 1:"
  puts averageTime

  1000.times do
    selection_sort1([3, -1, 5, 2])
    selection_sort1(long_input)
  end 

  averageTime = (Time.now - startTime) / 2000
  puts "Example 2:"
  puts averageTime
end

# Please add your pseudocode to this file
# And a written explanation of your solution
### selection_sort
## Initialize min value(min_index) to location 0
## Traverse the array to find the min element in the array
## While traversing, if any element smaller than min_index is found, then swap both the values
## Then, increment min_index to point to next element
## Repeat until array is sorted
###  3 > -1 = [-1, 3, 5, 2]
### 3 < 5 = [-1, 3, 5, 2]
### 5 > 2 = [-1, 3, 2, 5]
### 3 > 2 = [ -1, 2, 3, 5]

### Pseudocode ## selection_sort1
#EXAMPLE array = [ 3, -1, 5, 2]
#1. Iterate to find the smallest number in the array, swap with value at index 0
## smallest number is -1
## [-1, 3, 5, 2]
#2. Find the next smallest number, swap with value at index 1
## next smallest number is 2
## [-1, 2, 5, 3]
#3. Repeat until array is fully sorted
## next smallest number is 3
## [-1, 2, 3, 5]
