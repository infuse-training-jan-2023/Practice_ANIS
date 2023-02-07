class SerialAverage

  def compute_average(serial_input)

    regex = /^\d{3}-\d{2}.\d{2}-\d{2}.\d{2}/

    if serial_input.to_s.match(regex)

      # to split the string by '-'
      split_string = serial_input.split('-')

      # to calculate the average of xx and yy
      average = (split_string[1].to_f + split_string[2].to_f) / 2

      result = ''

      convert_avg_str = average.to_s

      split_avg = convert_avg_str.split('.')


      if(split_avg[0].length < 2)
        split_avg[0] = '0' + split_avg[0]
      end

      if(split_avg[1].length < 2)
        split_avg[1] = split_avg[1] + '0'
      end

      convert_avg_str =  split_avg[0] + '.' + split_avg[1]

      # final output
      return result = split_string[0] + '-' + convert_avg_str
    else
      return 'Invalid Input'
    end

  end

end


serial_number = "002-10.00-10.00"

sa = SerialAverage.new()
puts sa.compute_average(serial_number)
