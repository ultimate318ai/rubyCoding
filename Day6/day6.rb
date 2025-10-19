# Day 6 implementation
module Day6
  module_function

  def read_from_file
    fish_list = []
    File.open('input.txt').each do |line|
      fish_list = line.split(',').map(&:to_i)
    end
    fish_list
  end

  # First part of this challenge
  module Part1
    module_function

    def execute_puzzle_input
      input_results = Day6.read_from_file
      puts "Initial state: #{input_results}"
      puts "Number of Fish: #{Part1.iterate(80, input_results)}"
    end

    def decrement_fish_list(fish_list)
      fish_list.map { |fish| fish - 1 }
    end

    def append_new_fish_to_list(fish_list)
      new_fish = []
      fish_list.each { |fish| new_fish << 8 if fish.negative? }
      fish_list.map { |fish| fish.negative? ? 6 : fish } + new_fish
    end

    def iterate(days, initial_fish_list)
      fish_list = initial_fish_list
      count = 1
      while count < days + 1
        fish_list = decrement_fish_list(fish_list)
        fish_list = append_new_fish_to_list(fish_list)
        puts "After #{count} iteration(s): #{fish_list}"
        count += 1
      end
      fish_list.length
    end
  end

  # Second part of this challenge
  module Part2
    module_function

    @already_computed_values = {}
    @counter = 0

    def execute_puzzle_input
      input_results = Day6.read_from_file
      Part2.compute(256, input_results)
      puts "Number of Fish: #{@counter}"
    end

    def compute(days, initial_fish_list)
      initial_fish_list.map do |fish|
        @counter += find_fish(days, fish)
      end
    end

    # 26984457539
    # 824481730144761741006
    # 21469412525767308712452
    def find_fish(days, value, initial_call: true)
      return initial_call ? 1 : 0 if days <= value

      number_of_new_fish_with_current_value = days - value

      number_of_new_fish_with_new_fish = (1..number_of_new_fish_with_current_value).to_a.sum do |fish_position|
        days_remaining = days - (value + fish_position)
        key = "#{days_remaining}-#{value}"
        unless @already_computed_values.key?(key)
          @already_computed_values[key] = find_fish(days_remaining, 8, initial_call: false)
        end
        @already_computed_values[key]
      end
      1 + number_of_new_fish_with_current_value + number_of_new_fish_with_new_fish
    end
  end
end

# Day6::Part1.execute_puzzle_input
Day6::Part2.execute_puzzle_input
