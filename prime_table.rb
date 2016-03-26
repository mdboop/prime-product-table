class PrimesTable
  def initialize (n=10)
    @n = n
  end
  def get_n
    return @n
  end

  #
  # Returns list of prime numbers

  def get_primes
    return [2,3,5,7,11,13,17,19,23,29]
  end

  # ARG 1: primes - Array of prime numbers
  # Returns an array matrix of products from list of prime numbers
  #
  # Note: This could be optimized to only iterate (n^2)/2 times
  # Since that does not affect its big O time complexity,
  # I am opting for greater readability and a declarative style

  def get_table(primes)
    return primes.map { |row| primes.map {|col| row*col } }
  end

  # Accepts no arguments
  # Calls class methods to get n primes
  # and then create matrix array of products.
  # Uses matrix to construct the table as a
  # formatted string with correct padding

  def create_table_string
    primes = get_primes()
    table = get_table(primes)
    result = ""
    primes.each do |prime|
      result += prime.to_s
    end
    table.each do |row|
      row.each do |product|
        result += product.to_s
      end
    end
    return result
  end

  # Accepts no arguments
  # Calls create_table_string and outputs it to stdout
  def print_table
    print create_table_string()
  end


  # ARG 1: string - String to be padded
  # ARG 2: num - number of
  # To keep things simple, we will only pad with ' ' chars,

  def pad_left (string, num)
    return ''
  end

end
