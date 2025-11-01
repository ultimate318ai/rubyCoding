# Day 7 implementation
module Day7
  module_function

  def read_from_file
    crab_list = []
    File.open('input.txt').each do |line|
      crab_list = line.split(',').map(&:to_i)
    end
    crab_list
  end

  # First part of this challenge
  module Part1
    module_function

    def execute_puzzle_input
    end
  end

  # Second part of this challenge
  module Part2
    module_function

    def execute_puzzle_input
    end
  end
end

Day7::Part1.execute_puzzle_input
Day7::Part2.execute_puzzle_input
