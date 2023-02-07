require 'test/unit'

require_relative 'Array_Operation'

class TestArrayOperation < Test::Unit::TestCase
  def test_element_at
    a = [1, 2, 3, 4, 5, 6, 7, 8,]
    assert_equal(1, element_at(a, 0))
  end

  def test_element_at_negative_index
    a = [1, 2, 3, 4, 5, 6, 7, 8,]
    assert_equal('Invalid index', element_at(a, -1))
  end

  def test_inclusive_range
    a = [1, 2, 3, 4, 5, 6, 7, 8,]
    assert_equal([1,2,3], inclusive_range(a, 0, 3))
  end

  def test_inclusive_range_invalid_index
    a = [1, 2, 3, 4, 5, 6, 7, 8,]
    assert_equal('Invalid arguments', inclusive_range(a, 2, 10))
  end

  def test_inclusive_range_negative_index
    a = [1, 2, 3, 4, 5, 6, 7, 8,]
    assert_equal('Invalid arguments', inclusive_range(a, -2, 10))
  end

  def test_non_inclusive_range
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal([2,3,4], non_inclusive_range(a, 1, 5))
  end

  def test_non_inclusive_invalid_range
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal("Invalid arguments", non_inclusive_range(a, 6, 10))
  end

  def test_non_inclusive_negative_range
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal("Invalid arguments", non_inclusive_range(a, -1, 3))
  end

  def test_start_and_length
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal([2,3,4], start_and_length(a, 1, 3))
  end

  def test_start_and_length_invalid_range
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal("Length Out of Bound", start_and_length(a, 5, 4))
  end

  def test_start_and_length_negative_range
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    assert_equal("Invalid arguments", start_and_length(a, -5, 4))
  end

end
