require_relative "prime_table"

# This runs a simple command line interface which allows a single Integer as only argument

# ARG 1: Nil or String - possible Integer
#
# Helper function for handling arguments
# Attempts to parse as integer
# If ArgumentError is raised, print a message to stdout and return false
# If TypeError is raised, nothing was passed, so just return false

def can_parse_int? (n)
  begin
    n = Integer(n)
    rescue ArgumentError
      print "\nCannot parse argument to an integer, default will run\n\n"
      return false
    rescue TypeError
      return false
    end
    return true
end

if can_parse_int?(ARGV[0])
  PrimesTable.new(Integer(ARGV[0])).print_table()
else
  PrimesTable.new().print_table()
end


