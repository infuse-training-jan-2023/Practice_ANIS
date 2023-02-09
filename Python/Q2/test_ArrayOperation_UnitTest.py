from Array_Operation import ArrayOperations
import pytest
array = [9, 5, 1, 2, 3, 4, 0, -1]

def test_make_object():
    arry_op = ArrayOperations(array)
    assert(isinstance(arry_op, ArrayOperations))

def test_element_at_index():
    index = 1
    arry_op = ArrayOperations(array)
    assert 5 == arry_op.element_at(index)

def test_element_at_invalid_index():
    index = 'a'
    arry_op = ArrayOperations(array)
    with pytest.raises(Exception) as e:
        arry_op.element_at(index)

def test_element_at_neagtive_index():
    index = -2
    arry_op = ArrayOperations(array)
    with pytest.raises(Exception) as e:
        arry_op.element_at(index)

def test_inclusive_range():
    arry_op = ArrayOperations(array)
    assert [9, 5, 1, 2, 3] == arry_op.inclusive_range(0, 4)

def test_inclusive_negative_range_():
    arry_op = ArrayOperations(array)
    with pytest.raises(Exception) as e:
        arry_op.inclusive_range(-1, 4)

def test_inclusive_invalid_range_():
    arry_op = ArrayOperations(array)
    with pytest.raises(Exception) as e:
        arry_op.inclusive_range(5, 4)

def test_non_inclusive_range():
    arry_op = ArrayOperations(array)
    assert [9, 5, 1, 2] == arry_op.non_inclusive_range(0, 4)


def test_non_inclusive_negative_range_():
    arry_op = ArrayOperations(array)
    with pytest.raises(Exception) as e:
        arry_op.non_inclusive_range(-1, 4)

def test_non_inclusive_invalid_range_():
    arry_op = ArrayOperations(array)
    with pytest.raises(Exception) as e:
        arry_op.non_inclusive_range(5, 4)


def test_start_and_length():
    arry_op = ArrayOperations(array)
    assert [9, 5, 1, 2, 3] == arry_op.start_and_length(0, 4)

def test_start_and_length():
    arry_op = ArrayOperations(array)
    with pytest.raises(Exception) as e:
        arry_op.start_and_length(-1, 4)

def test_start_and_length():
    arry_op = ArrayOperations(array)
    with pytest.raises(Exception) as e:
        arry_op.start_and_length(5, 4)


def test_start_and_length():
    arry_op = ArrayOperations(array)
    assert [9, 5, 1, 2, 3] == arry_op.start_and_length(0, 4)
