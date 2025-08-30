# Day 3 implementation
module Day3
  def read_from_file
    input_array = []
    File.foreach('input.txt') do |line|
      input_array << line.to_s
    end
    input_array
  end

  def retrieve_number_of_zero_per_digit(input_array)
    number_of_zero_per_element_digit = []
    input_array.each do |element|
      element.each do |digit, index|
        number_of_zero_per_element_digit[index] += 1 if digit.zero?
      end
    end
    number_of_zero_per_element_digit
  end

  def day3_first_part(input_array)
    gamma_rate = ''

    retrieve_number_of_zero_per_digit(input_array).each do |number_of_zero|
      gamma_rate += number_of_zero >= input_array.length / 2 ? '0' : '1'
    end
    epsilon_rate = (gamma_rate.ord(2) ^ 0xff).chr(2)

    puts gamma_rate
    puts epsilon_rate

    gamma_rate.to_i(2) * epsilon_rate.to_i(2)
  end
end

input_array = Day2.read_from_file
puts Day2.day2_first_part(input_array)
