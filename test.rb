require_relative "prime_table"
require "minitest/autorun"

class TestPrimes < Minitest::Test

  def test_primes_default_value
    assert_equal(10, PrimesTable.new().get_n())
  end

end
