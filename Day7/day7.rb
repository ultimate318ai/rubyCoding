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
      crab_list = Day7.read_from_file
      min_crab = crab_list.min
      max_crab = crab_list.max

      # Fuel costs 1 on each position
      fuel_cost_by_position = (min_crab..max_crab).to_a.map do |position|
        crab_list.sum { |crab| (crab - position).abs }
      end
      min_consumption_position = fuel_cost_by_position.min
      puts "min_consumption_position: #{fuel_cost_by_position.index(min_consumption_position)}"
      puts "optional_consumption: #{min_consumption_position}"
    end
  end

  # Second part of this challenge
  module Part2
    module_function

    def execute_puzzle_input
      crab_list = Day7.read_from_file
      min_crab = crab_list.min
      max_crab = crab_list.max

      # Fuel costs 1 more on each position, 1 for move 1, 2 for move 2, ...
      # So its the sum_k=1^n(k) = n(n+1)/2
      fuel_cost_by_position = (min_crab..max_crab).to_a.map do |position|
        crab_list.sum { |crab| (crab - position).abs * ((crab - position).abs + 1) / 2 }
      end
      min_consumption_position = fuel_cost_by_position.min
      puts "min_consumption_position: #{fuel_cost_by_position.index(min_consumption_position)}"
      puts "optional_consumption: #{min_consumption_position}"
    end
  end
end

Day7::Part1.execute_puzzle_input
Day7::Part2.execute_puzzle_input
