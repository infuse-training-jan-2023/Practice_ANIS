def skip_sports(array, skip_no)

  if(!skip_no.is_a? Integer)
    return "invalid skip_no"
  elsif ( skip_no > array.length)
    return "invalid skip_no"
  elsif (skip_no <= 0)
    return "invalid skip_no"
  end

  return array[skip_no, array.length]

end


sports = ['Cricket', 'TT', 'Football', 'Hockey']

skip_no = 2

puts skip_sports(sports, skip_no)

