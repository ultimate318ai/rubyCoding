# Day 3 implementation
module Day3
  module_function

  def read_from_file
    input_array = []
    File.foreach('input.txt') do |line|
      input_array << line.to_s
    end
    input_array
  end

  def retrieve_number_of_zero_per_digit(input_array)
    number_of_zero_per_element_digit = Array.new(input_array[0].length - 1, 0)
    input_array.each do |element|
      element.chars.each_with_index do |digit, index|
        number_of_zero_per_element_digit[index] += 1 if digit == '0'
      end
    end
    number_of_zero_per_element_digit
  end

  def retrieve_number_of_zero_at(input_array, position)
    sum = 0
    input_array.each do |element|
      sum += 1 if element[position] == '0'
    end
    sum
  end

  def filter_with_digit_at(array, digit, position)
    array.select! do |element|
      element[position] == digit
    end
    array
  end

  def day3_first_part(input_array)
    gamma_rate = ''

    retrieve_number_of_zero_per_digit(input_array).each do |number_of_zero|
      gamma_rate += number_of_zero > ((input_array.length - 1) / 2) ? '0' : '1'
    end

    epsilon_rate = gamma_rate.clone
    gamma_rate.chars.each_with_index do |digit, index|
      epsilon_rate[index] = digit == '0' ? '1' : '0'
    end
    gamma_rate.to_i(2) * epsilon_rate.to_i(2)
  end

  def oxygen_generator_rating(input_array)
    input_array_oxygen_generator_rating = input_array.clone
    position = 0
    while input_array_oxygen_generator_rating.length > 1
      number_of_zero = retrieve_number_of_zero_at(input_array_oxygen_generator_rating, position)
      # If equality, then 1 should be used
      digit = number_of_zero > (input_array_oxygen_generator_rating.length / 2) ? '0' : '1'
      filter_with_digit_at(input_array_oxygen_generator_rating, digit, position)
      position += 1
    end
    input_array_oxygen_generator_rating[0]
  end

  def co2_scrubber_rating(input_array)
    input_array_co2_scrubber_rating = input_array.clone
    position = 0
    while input_array_co2_scrubber_rating.length > 1
      number_of_zero = retrieve_number_of_zero_at(input_array_co2_scrubber_rating, position)
      # If equality, then 0 should be used
      digit = number_of_zero <= (input_array_co2_scrubber_rating.length / 2) ? '0' : '1'
      filter_with_digit_at(input_array_co2_scrubber_rating, digit, position)
      position += 1
    end
    input_array_co2_scrubber_rating[0]
  end

  def day3_second_part(input_array)
    oxygen_generator_rating = oxygen_generator_rating(input_array)
    co2_scrubber_rating = co2_scrubber_rating(input_array)
    oxygen_generator_rating.to_i(2) * co2_scrubber_rating.to_i(2)
  end
end

input_array = Day3.read_from_file
puts Day3.day3_first_part(input_array)
puts Day3.day3_second_part(input_array)
