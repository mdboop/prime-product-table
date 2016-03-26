require_relative "prime_table"
def print_table()
  primes_table = PrimesTable.new()
  primes = primes_table.get_primes()
  table = primes_table.get_table(primes)

  # Let's use the longest number to calculate padding
  last_index = primes.length - 1
  cell_width = table[last_index][last_index].to_s.length

  result = " " * cell_width + "  "

  primes.each_with_index {|num, i| result += pad_left(num, calc_pad(cell_width, num)) }
  result += "\n" + "=" * result.length + "\n"
  horizontal_divider = "-" * result.length + "\n"

  table.each_with_index do |row, i|
    row_head = primes[i]
    pad_length = calc_pad(cell_width, row_head)
    result += pad_right(row_head, pad_length) + "||"
    row.each do |col|
      pad = calc_pad(cell_width, col)
      result += pad_left(col, pad)
    end
    result += "\n"
  end
  result += "\n"

  print result
  return result

end

def pad_left (char, num)
  char = char.to_s
  pad = " " * num
  return char + pad + "  "
end

def pad_right (char, num)
  char = char.to_s
  pad = " " * num
  return pad + char
end

def calc_pad (max, char)
  max - char.to_s.length
end

table = print_table()

# print table.length
