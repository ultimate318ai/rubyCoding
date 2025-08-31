# Day 4 implementation
module Day4
  # Grid in bingo game
  class Grid
    def initialize(height, width, values)
      @height = height
      @width = width
      @grid_values = values.each_with_index.with_object({}) do |(element, index), grid|
        puts grid
        puts element
        puts index
        value_width_position = index % height
        value_height_position = index / width
        grid[value_height_position] = {} unless grid.key?(value_height_position)
        grid[value_height_position][value_width_position] = element
      end
    end

    def to_s
      @grid_values
    end
  end
end

# input_array = Day4.read_from_file
puts Day4::Grid.new(5, 5, [22, 13, 17, 11, 0,
                           8, 2, 23, 4, 24,
                           21, 9, 14, 16, 7,
                           6, 10, 3, 18,  5,
                           1, 12, 20, 15, 19])
# puts Day4.first_part(input_array)
# puts Day4.second_part(input_array)
