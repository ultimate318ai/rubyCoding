# Day 4 implementation
module Day4
  # Grid in bingo game
  class Grid
    def initialize(height, width, values)
      @height = height
      @width = width
      @grid_values = values.each_with_index.with_object({}) do |(element, index), grid|
        value_width_position = index % height
        value_height_position = index / width
        grid[value_height_position] = {} unless grid.key?(value_height_position)
        grid[value_height_position][value_width_position] = { value: element, marked: false }
      end
    end

    def mark_all(value)
      @grid_values.each_value do |row|
        row.each_value do |column_element|
          column_element[:marked] = true if column_element[:value] == value
        end
      end
    end

    def winning?
      row_winning? || column_winning?
    end

    def to_s
      @grid_values
    end

    private

    def row_winning?
      @grid_values.any? do |_, row|
        row.all? do |_, column_element|
          column_element[:marked]
        end
      end
    end

    def column_winning?
      @grid_values.all? do |_, row|
        row.each_value.first[:marked]
      end
    end
  end
end

# input_array = Day4.read_from_file

grid = Day4::Grid.new(5, 5, [22, 13, 17, 11, 0,

                             8, 2, 23, 4, 24,

                             21, 9, 14, 16, 7,

                             6, 10, 3, 18,  5,

                             1, 12, 20, 15, 19])

# puts grid
puts grid.winning?

grid.mark_all(22)
puts grid.winning?

grid.mark_all(8)
puts grid.winning?

grid.mark_all(21)
puts grid.winning?

grid.mark_all(6)
puts grid.winning?

grid.mark_all(0)
puts grid.winning?

grid.mark_all(1)
puts grid.winning?

# puts Day4.first_part(input_array)
# puts Day4.second_part(input_array)
