# Prime Product Table

Print a multiplication table of prime numbers

## Instructions

### Installation & Use

1. In your terminal, run `git clone https://github.com/mdboop/prime-product-table.git && cd prime-product-table`
2. In the root directory, run `ruby index.rb <n>` where `n` is the number of primes to be used in creating the table

**note:** If no argument is passed, it will default to 10. Additionally, it may not print well above 30, depending on screen resolution/size

### Tests

1. To run the tests, run `ruby test.rb` in the root directory

## Notes

### Design & Approach
This class exposes one public method, `print_table`, which accepts no arguments.

Additionally, given the scope and purpose of this exercise, I decided to encapsulate all logic
inside a single class. A likely refactor would be to pull out the prime calculation into its own class, since it would only be responsible for calculating primes, and the PrimesTable class would only be responsible for creating and printing the table.

### Time Complexity

#### Prime-Finding Algorithms
For small (<10000) n values, a O(n√n) function `find_primes` is used
For larger (>10000) n values, a Sieve of Eratosthenes is used, which is O(n*log(log(n)))

#### Prime Products Algorithm
Creating the table of primes is done in O(n^2) time. It could be optimized to run at (n^2)/2, but
since that does not affect the big O notation, I opted for a more readable, declarative implementation


