# Day 4 implementation
module Day4
  # Grid in bingo game
  class Grid
    def initialize(height, width, values)
      @height = height
      @width = width
      @grid_values = values.flatten.each_with_index.with_object({}) do |(element, index), grid|
        value_width_position = index % width
        value_height_position = index / height
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

    def score(winning_value)
      return 0 unless winning?

      not_marked_sum = @grid_values.sum do |_, row|
        row.sum do |_, column_value|
          column_value[:marked] ? 0 : column_value[:value].to_i
        end
      end
      winning_value.to_i * not_marked_sum
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
      columns_winning = Array.new(5, true)
      @grid_values.each_value do |row|
        row.each_value.with_index do |column_value, index|
          columns_winning[index] = false unless column_value[:marked]
        end
      end
      columns_winning.any?
    end
  end

  module_function

  def read_from_file
    input_results = []
    grids_values = []
    File.open('input.txt').each_with_index do |line, index|
      input_results = line.split(',') if index.zero?
      grids_values << line.split unless index.zero? || line.split.empty?
    end
    [input_results, grids_values]
  end

  def populate_grids(grids_values)
    grids = []
    grids_values.each_slice(5) do |values| # One line consist in 5 values
      grids << Day4::Grid.new(5, 5, values)
    end
    grids
  end

  def first_part(input_results, grids_values)
    grids = populate_grids(grids_values)
    input_results.each do |value|
      grids.each do |grid|
        grid.mark_all(value)
        return grid.score(value) if grid.winning?
      end
    end
    'No Grid has won'
  end
end

(input_results, grids_values) = Day4.read_from_file
puts Day4.first_part(input_results, grids_values)
# puts Day4.second_part(input_array)
