def merge_sort(array)

  return array if array.length <= 1

  mid_point = (array.length / 2)
  left_array = array[0..(mid_point - 1)]
  right_array = array[mid_point..(array.length-1)]

  left_merge = merge_sort(left_array)
  right_merge = merge_sort(right_array)

  merge(left_merge, right_merge)
end

def merge(left_arr, right_arr)
  new_arr = []
  i = 0
  j = 0
  while new_arr.length < left_arr.length + right_arr.length
    if i == left_arr.length
      (j..right_arr.length-1).each { |index| new_arr << right_arr[index] }
    elsif j == right_arr.length
      (i..left_arr.length-1).each { |index| new_arr << left_arr[index] }
    else
      if left_arr[i] <= right_arr[j]
        new_arr << left_arr[i]
        i += 1
      else
        new_arr << right_arr[j]
        j += 1
      end
    end
  end
  new_arr
end

p merge_sort([1,3,7,2,5,2,-5])