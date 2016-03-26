require_relative "prime_table"
require "minitest/autorun"

class TestPrimes < Minitest::Test

  def test_primes_default_value
    assert_equal 10, PrimesTable.new().send(:get_n), "It should default to 10 for n"
  end

  def test_primes_get_n
    assert_equal 100, PrimesTable.new(100).send(:get_n), "It should correctly set n when it is passed in"
  end

  def test_primes_get_primes
    assert_equal [2,3,5,7,11,13,17,19,23,29], PrimesTable.new().send(:get_primes),
    "get_primes should return the correct prime numbers"
    assert_equal [2,3,5,7,11,13,17,19,23,29,31,37], PrimesTable.new(12).send(:get_primes),
    "get_primes should return the correct prime numbers when passed different n"
  end

  def test_primes_create_table
    primes_table = PrimesTable.new()
    primes = primes_table.send(:get_primes)
    table = primes_table.send(:create_table, primes)

    assert_instance_of Array, table, "It should return an array"
    assert_instance_of Array, table[0], "It should return a two-dimensional array"
    assert_instance_of Array, table[table.length - 1], "It should return a two-dimensional array NxN"
    assert_equal 29*29, table[9][9], "The array should contain the correct values"
    assert_equal 2*29, table[0][9], "The array should contain the correct values"
  end

  def test_primes_create_table_string
    primes_table = PrimesTable.new()
    primes = primes_table.send(:get_primes)
    table = primes_table.send(:create_table, primes)
    table_string = primes_table.send(:create_table_string)

    assert_instance_of(String, table_string, "Creating the table should return a string")
    primes.each do |prime|
      assert (table_string.include? prime.to_s), "All of the primes should be found in the output string"
    end

    table.each do |row|
      row.each do |primeProduct|
        assert (table_string.include? primeProduct.to_s), "All of the prime products should be in the output string"
      end
    end

  end

  def test_primes_print_table

    out, err = capture_subprocess_io do
      PrimesTable.new().print_table()
    end

    assert_match %r%2%, out, "It should output to stdout"
  end

  def test_primes_pad_left
    primes_table = PrimesTable.new()
    string = 55.to_s
    padded_string = primes_table.send(:pad_left, string, 4)
    assert_equal 6, padded_string.length, "pad_left should pad a string with the correct number of spaces"
    assert_equal padded_string[0], " ", "pad_left should return a string with at least one starting space"
  end

  def test_primes_pad_right
    primes_table = PrimesTable.new()
    string = 55.to_s
    padded_string = primes_table.send(:pad_left, string, 4)
    padded_string = primes_table.send(:pad_right, string, 4)
    assert_equal 6, padded_string.length, "pad_right should pad a string with the correct number of spaces"
    assert_equal padded_string[padded_string.length - 1], " ", "pad_right should return a string with at least one ending space"
  end

  def test_primes_calc_pad
    primes_table = PrimesTable.new()
    string = 55.to_s
    max = 3
    assert_equal 1, primes_table.send(:calc_pad, string, max), "calc_pad should return the difference of the max cell width and length of the current string"
  end


end
