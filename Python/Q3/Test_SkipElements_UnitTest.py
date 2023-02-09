from Skip_Elements import SkipElement
import pytest

sports = ['Cricket', 'TT', 'Football', 'Hockey']
skip_ele = SkipElement(sports)

def test_make_object():
    assert(isinstance(skip_ele, SkipElement))

def test_skip_sports():
    assert ['TT', 'Football', 'Hockey'] == skip_ele.skip_sports(1)

def test_skip_sports_invalid_value():
    with pytest.raises(Exception) as e:
        skip_ele.skip_sports("a")

def test_skip_sports_out_value():
    with pytest.raises(Exception) as e:
        skip_ele.skip_sports(5)
