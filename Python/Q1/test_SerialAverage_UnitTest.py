from SerialAverage import SerialAverage

def test_make_object():
    serial_number = "002-10.00-10.00"
    serial_avg = SerialAverage(serial_number)
    assert(isinstance(serial_avg,SerialAverage))

def test_compute_average():
    serial_number = "002-10.00-10.00"
    serial_avg = SerialAverage(serial_number)
    assert "002-10.00" == serial_avg.compute_average()

def test_compute_average_valid_input():
    serial_number = "002-30.00-20.00"
    serial_avg = SerialAverage(serial_number)
    assert "002-25.00" == serial_avg.compute_average()

def test_compute_average_invalid_input():
    serial_number = "002-aa.00-20.00"
    serial_avg = SerialAverage(serial_number)
    assert "Invalid Input" == serial_avg.compute_average()

def test_compute_average_empty_input():
    serial_number = " "
    serial_avg = SerialAverage(serial_number)
    assert "Invalid Input" == serial_avg.compute_average()
