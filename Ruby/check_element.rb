array = [2,3,5,6,7,9,7]

sizeofarray = array.count

if (array.include? 7)
    if (array[0] == 7)
        puts "Element available at First Position"

    elsif (array[sizeofarray-1] == 7)
        puts "Element available at Last Position"

    else
        puts "Element available but not at first or last position"
    end
else
    puts "Element not available"

end

# if (array.include? 1)
#     puts "Element available"
# else
#     puts "Element not available"
# end
