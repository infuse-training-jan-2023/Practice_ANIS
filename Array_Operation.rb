def element_at(arr, index)

  if(index < 0 || index > arr.size)
    return "Invalid index";
  end
  puts "Element at index #{index} is:"
  puts "#{arr[index]}"

  return arr[index]
end

def inclusive_range(arr, start_pos, end_pos)

  if(start_pos < 0 || start_pos > arr.size || end_pos < 0 || end_pos > arr.size)
    return "Invalid arguments"
  end
  return arr[start_pos...end_pos]

end

def non_inclusive_range(arr, start_pos, end_pos)

  if(start_pos < 0 || start_pos > arr.size || end_pos < 0 || end_pos > arr.size)
    return "Invalid arguments"
  end
  return arr[start_pos...end_pos-1]

end

def start_and_length(arr, start_pos, length)

  if(start_pos < 0 || start_pos > arr.size || length < 0 || length > arr.size)
    return "Invalid arguments"
  end

  if((start_pos+length) < arr.length)
     arr[start_pos, length]
  else
    return "Length Out of Bound"
  end
end

arr = [9, 5, 1, 2, 3, 4, 0, -1]



puts element_at(arr, 0)

puts "\ninclusive range Start Position#{0} and End Position#{4}"
puts inclusive_range(arr, 0, 4)


puts "\nnon_inclusive range"
puts non_inclusive_range(arr, 1, 5)

puts "\nstart_and_length"
puts start_and_length(arr, 5, 4)
