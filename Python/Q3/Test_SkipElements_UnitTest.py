from SkipElements import SkipElement
import pytest
sports = ['Cricket', 'TT', 'Football', 'Hockey']

def test_make_object():
    skip_ele = SkipElement(sports)
    assert(isinstance(skip_ele, SkipElement))


def test_skip_sports():
    skip_ele = SkipElement(sports)
    assert ['TT', 'Football', 'Hockey'] == skip_ele.skip_sports(1)

def test_skip_sports_invalid_value():
    skip_ele = SkipElement(sports)
    with pytest.raises(Exception) as e:
        skip_ele.skip_sports("a")

def test_skip_sports_out_value():
    skip_ele = SkipElement(sports)
    with pytest.raises(Exception) as e:
        skip_ele.skip_sports(5)
