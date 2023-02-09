import re

class SerialAverage:
    def compute_average(self, input):
        regex = re.findall("^\\d{3}-\\d{2}.\\d{2}-\\d{2}.\\d{2}", input)
        if (regex):
            split_string = input.split('-')
            average = (float(split_string[1]) + float(split_string[2])) / 2
            result = ''
            convert_avg_str = str(average)
            split_avg = convert_avg_str.split('.')

            if(len(split_avg[0]) < 2):
                split_avg[0] = '0' + split_avg[0]

            if(len(split_avg[1]) < 2):
                split_avg[1] = split_avg[1] + '0'

            convert_avg_str =  split_avg[0] + '.' + split_avg[1]
            result = split_string[0] + '-' + convert_avg_str
            return result
        else:
            return "Invalid Input"

serial_number = "002-10.00-10.00"
serial_avg = SerialAverage()
print("Average is: " + serial_avg.compute_average(serial_number))

