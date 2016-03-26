require_relative "prime_table"

# Simple command line interface which allows a single Integer as only argument
#
# Performs a nil check and catches ArgumentError if passed a value
# that cannot be parsed to an integer

unless ARGV[0].nil?
  begin
    n = Integer(ARGV[0])
    rescue ArgumentError
      n = 10
      puts 'Please pass in an integer, defaulting to 10'
  end
  PrimesTable.new(n).print_table()
else
  PrimesTable.new().print_table()
end
