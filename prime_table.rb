class PrimesTable
  def initialize (n=10)
    @n = n
  end
  def get_n
    return @n
  end

  # Accepts no arguments
  # Calls create_table_string and outputs it to stdout
  def print_table
    print create_table_string()
  end

  # ARG 1: primes - Array of prime numbers
  # Returns an array matrix of products from list of prime numbers
  #
  # Note: This could be optimized to only iterate (n^2)/2 times
  # Since that does not affect its big O time complexity,
  # I am opting for greater readability and a declarative style

  def create_table(primes)
    return primes.map { |row| primes.map {|col| row*col } }
  end

  #
  # Returns list of prime numbers

  def get_primes
    n = get_n()
    if n < 10000
      return find_primes(n)
    else
      return find_primes_with_sieve(n)
    end
  end


  def is_prime(num)
    for i in 2..Math.sqrt(num)
      if i != num && num % i == 0
        return false
      end
    end
    return true
  end

  def find_primes (n)
    primes = []

    i = 2
    while primes.length < n
      if is_prime(i)
        primes.push(i)
      end
      i += 1
    end
    return primes
  end

  # Accepts no arguments
  # Calls class methods to get n primes
  # and then create matrix array of products.
  # Uses matrix to construct the table as a
  # formatted string with correct padding

  def create_table_string

    primes = get_primes()
    table = create_table(primes)
    n = primes.length
    # The longest number will always be in the bottom-rightmost cell
    # Convert the value to a string and get the length +1 for the fixed cell width
    cell_width = table[n - 1][n - 1].to_s.length + 1

    result = " " * cell_width + "  "

    # Add column headers (each prime number) with correct padding
    primes.each do |prime|
      prime = prime.to_s
      result += pad_left(prime, calc_pad(prime, cell_width))
    end

    # After column headers, add a divider of '=' characters to span entire length
    result += "\n" + "=" * result.length + "\n"


    table.each_with_index do |row, i|
      # For each row, use the index to add the row header with correct padding plus a '||' divider
      row_head = primes[i]
      pad_length = calc_pad(row_head.to_s, cell_width)
      result += pad_left(row_head.to_s, pad_length) + "||"

      row.each do |cell|
        # For each cell, pad correctly and add to result
        pad_length = calc_pad(cell.to_s, cell_width)
        result += pad_left(cell.to_s, pad_length)
      end

      result += "\n"
    end

    return result
  end

  # ARG 1: string - String to be padded
  # ARG 2: num - number of
  # To keep things simple, we will only pad with ' ' chars
  def pad_left (string, num)
    pad = " " * num
    return pad + string
  end

  # ARG 1: string - String to be padded
  # ARG 2: num - number of
  # To keep things simple, we will only pad with ' ' chars
  def pad_right (string, num)
    pad = " " * num
    return string + pad
  end

  # ARG 1: string - String to calculate padding for (based on length)
  # ARG 2: max - Integer representing the maximum cell width for current table
  # Returns the difference between the max cell width and current string length
  def calc_pad (string, max)
    return max - string.length
  end

end
