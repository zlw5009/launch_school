class Diamond
  def self.make_diamond(letter)
    letters = *('A'..letter)
    total_rows = letters.size + (letters.size - 1)
    diamond = []
    row = 1

      loop do
        diamond << build_row(letters, row, total_rows)

        row += 1

        break if row > total_rows
      end

    diamond.join("\n") + "\n"
  end

  private 

  def self.outter_spaces(letters, row)
    (letters.size - row).abs
  end

  def self.inner_spaces(outter_spaces, total_spaces)
    ((total_spaces - 2) - (outter_spaces * 2)).abs
  end

  def self.build_row(letters, row, total_rows)
    total_spaces = total_rows
    outter_spaces = ' ' * (outter_spaces(letters, row))
    inner_spaces = ' ' * inner_spaces(outter_spaces.size, total_spaces)

    if row == 1 || row == total_rows
      outter_spaces + letters.first + outter_spaces
    elsif letters.size == row
      letters.last + inner_spaces + letters.last
    elsif letters.size > row
      outter_spaces + letters[row - 1] + inner_spaces + letters[row - 1] + outter_spaces
    else
      outter_spaces + letters[total_rows - row] + inner_spaces + letters[total_rows - row] + outter_spaces
    end
  end
end

module Bookkeeping
  VERSION = 1
end

puts Diamond.make_diamond("K")

# Top down approach

# total spaces = array.size + (array.size-1) => 7 
# side spaces = array.size - (position of element in array + 1) => a: 3, b: 2, c:1, d: 0
# inner spaces = if 1 letter = 0 else total space - 2 - (side_spaces * 2)

# So we build the diamond by passing in the row_number (which is the total num of spaces)
# and the array of letters
# If the row passed in is 1
# form row one 
# increment counter by 1
# If row_num == letters_ary.size 0 outer spaces
# If row_num == letters_ary.last same thing as row 1

# on row 5 and 6 there won't be an element in the array
# so we can take the total_rows - row to give us our element 




