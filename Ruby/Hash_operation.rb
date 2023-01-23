def add_to_hash(hashname, key, value)
  hashname.store(key, value)

  hashname.each do |key, value|
    puts "#{key} value #{value}"
  end

  return hashname
end

def retain_integer(hashname)
  hashname.each do |key, value|
    if(!key.is_a? Integer)
      hashname.delete(key)
    end
  end

  return hashname

end

def delete_even_key(hashname)
  hashname.each do |key, value|
    if(key.is_a? Integer)
      if(key.even?)
        hashname.delete(key)
      end
    end
  end

  return hashname
end

hashname = {key1: 'Anis', key2: 'Leon', key3: 'Jeston'}

puts "Add Key Value to Hash"
add_to_hash(hashname, 543121, 100)

puts "\nRetain Integer Key"
puts retain_integer(hashname)

add_to_hash(hashname, 2, 10)
add_to_hash(hashname, 4, 8)
add_to_hash(hashname, 3, 6)

puts "\nDelete Even valued Keys"
delete_even_key(hashname)



