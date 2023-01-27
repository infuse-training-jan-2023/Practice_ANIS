require 'test/unit'

require_relative 'SerialAverage'

class TestSerialAverage < Test::Unit::TestCase

  def test_make_serial_average_object
    created_serial_average = SerialAverage.new()
    assert created_serial_average.instance_of? SerialAverage
  end

  def test_set_compute_average
    created_serial_average = SerialAverage.new()
    computed_average = created_serial_average.compute_average("002-10.00-10.00")
    assert_equal("002-10.00", computed_average.to_s)
  end

  def test_set_compute_average_with_invalid_params
    created_serial_average = SerialAverage.new()
    computed_average = created_serial_average.compute_average("002-1a.00-10.00")
    assert_equal('Invalid Input', computed_average.to_s)
  end

  def test_set_compute_average_with_invalid_integer_params
    created_serial_average = SerialAverage.new()
    computed_average = created_serial_average.compute_average(10)
    assert_equal('Invalid Input', computed_average)
  end

  def test_set_compute_average_with_negative_params
    created_serial_average = SerialAverage.new()
    computed_average = created_serial_average.compute_average(-1)
    assert_equal('Invalid Input', computed_average)
  end

end
