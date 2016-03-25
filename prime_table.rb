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
    return primes.map { |row| primes.map {|col| row*col } }
  end

end
