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
    number_of_zero_per_element_digit = Array.new(input_array[0].length, 0)
    input_array.each do |element|
      element.chars.each_with_index do |digit, index|
        number_of_zero_per_element_digit[index] += 1 if digit == '0'
      end
    end
    number_of_zero_per_element_digit
  end

  def day3_first_part(input_array)
    gamma_rate = ''

    retrieve_number_of_zero_per_digit(input_array).each do |number_of_zero|
      gamma_rate += number_of_zero >= input_array.length / 2 ? '0' : '1'
    end

    epsilon_rate = gamma_rate
    gamma_rate.chars.each_with_index do |digit, index|
      epsilon_rate[index] = digit == '0' ? '1' : '0'
    end

    gamma_rate.to_i(2) * epsilon_rate.to_i(2)
  end
end

input_array = Day3.read_from_file
puts Day3.day3_first_part(input_array)
