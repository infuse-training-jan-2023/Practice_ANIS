require 'test/unit'

require_relative 'Skip_element'

class Test_SkipElement < Test::Unit::TestCase

  def test_skip_sports
    sports = ['Cricket', 'TT', 'Football', 'Hockey']
    assert_equal(["Football", "Hockey"], skip_sports(sports, 2))
  end

  def test_skip_sports_invalid_skip
    sports = ['Cricket', 'TT', 'Football', 'Hockey']
    assert_equal("invalid skip_no", skip_sports(sports, 6))
  end

  def test_skip_sports_negative_skip
    sports = ['Cricket', 'TT', 'Football', 'Hockey']
    assert_equal("invalid skip_no", skip_sports(sports, -2))
  end

  def test_skip_sports_character_skip
    sports = ['Cricket', 'TT', 'Football', 'Hockey']
    assert_equal("invalid skip_no", skip_sports(sports, 'a'))
  end

end


