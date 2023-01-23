require 'test/unit'

require_relative 'Hash_operation'

class Test_HashOperation < Test::Unit::TestCase

  def test_add_to_hash
    hash = { 'a' => 1, 'b' => 2, 'c' => 3}
    assert_equal({ 'a' => 1, 'b' => 2, 'c' => 3, 543121=> 100 }, add_to_hash(hash, 543121, 100))
  end

  def test_retain_integer
    hash = { 'a' => 1, 'b' => 2, 'c' => 3, 543121=> 100}
    assert_equal({543121=> 100}, retain_integer(hash))
  end

  def test_delete_even_key
    hash = { 'a' => 1, 'b' => 2, 'c' => 3, 543121=> 100, 2 => 100, 3=> 2, 5=> 1}
    assert_equal({"a"=>1, "b"=>2, "c"=>3, 543121=> 100, 3=> 2, 5=> 1}, delete_even_key(hash))
  end

end

