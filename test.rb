require_relative "prime_table"
require "minitest/autorun"

class TestPrimes < Minitest::Test

  def test_primes_default_value
    assert_equal(10, PrimesTable.new().get_n(), "It should default to 10 for n")
  end

  def test_primes_get_n
    assert_equal(100, PrimesTable.new(100).get_n(), "It should correctly set n when it is passed in")
  end

  def test_primes_get_primes
    assert_equal([2,3,5,7,11,13,17,19,23,29], PrimesTable.new().get_primes(), "It should return the correct prime numbers")
  end

  def test_primes_get_table
    primes_table = PrimesTable.new()
    primes = primes_table.get_primes()
    table = primes_table.get_table(primes)

    assert_instance_of(Array, table, "It should return an array")
    assert_instance_of(Array, table[0], "It should return a two-dimensional array")
    assert_instance_of(Array, table[table.length - 1], "It should return a two-dimensional array NxN")
    assert_equal(29*29, table[9][9], "The array should contain the correct values")
    assert_equal(2*29, table[0][9], "The array should contain the correct values")
  end

  def test_primes_create_table_string
    table_string = PrimesTable.new().create_table_string()
    assert_instance_of(String, table_string, "Creating the table should return a string")
  end


end
