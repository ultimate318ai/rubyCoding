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
        grid[value_height_position][value_width_position] = { value: element, marked?: false }
      end
    end

    def mark_all(value)
      @grid_values.each do |row|
        row.each do |column_element|
          column_element[:marked?] = true if column_element[:value] == value
        end
      end
    end

    def grid_winning?
      row_winning? || column_winning?
    end

    def to_s
      @grid_values
    end

    private

    def row_winning?
      @grid_values.any? do |row|
        row.all? do |column_element|
          column_element[:marked?] = true
        end
      end
    end

    def column_winning?
      @grid_values.all? do |row|
        row.first[:marked?]
      end
    end
  end
end

# input_array = Day4.read_from_file
# puts Day4.first_part(input_array)
# puts Day4.second_part(input_array)
