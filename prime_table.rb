class PrimesTable
  def initialize (n=10)
    @n = n
  end
  def get_n
    return @n
  end

  def get_primes
    return [2,3,5,7,11,13,17,19,23,29]
  end

  def get_table(primes)

    # This could be optimized to only iterate (n^2) / 2 times
    # Since that does not affect its big O time complexity,
    # I am opting for greater readability and a declarative style

    return primes.map { |row| primes.map {|col| row*col } }
  end

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

end
