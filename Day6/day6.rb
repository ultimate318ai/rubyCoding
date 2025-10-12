# Day 6 implementation
module Day6
  module_function

  def read_from_file_part1
    fish_list = []
    File.open('input.txt').each do |line|
      fish_list = line.split(',').each(&:to_i)
    end
    fish_list
  end

  def first_part
    input_results = Day6.read_from_file_part1
    puts 'number of fish:'
    puts input_results
  end
end

Day6.first_part
