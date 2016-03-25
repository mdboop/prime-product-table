require_relative "prime_table"
require "minitest/autorun"

class TestPrimes < Minitest::Test

  def test_primes_default_value
    assert_equal(10, PrimesTable.new().get_n(), "It should default to 10 for n")
  end

  def test_primes_get_n
    assert_equal(100, PrimesTable.new(100).get_n(), "It should correctly set n when it is passed in");
  end

  def test_primes_get_primes
    assert_equal([2,3,5,7,11,13,17,19,23,29], PrimesTable.new().get_primes())
  end

end
