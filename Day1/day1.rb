# First Day of coding challenge in ruby!'
module Program
  SLIDING_WINDOW_SIZE = 3

  module_function

  def read_from_file
    array = []
    File.foreach('input.txt') { |line| array << line.to_i }
    array
  end

  def day1_first_part(array)
    last_element = -1
    counter = 0
    array.each do |element|
      counter += 1 if last_element != -1 && last_element < element
      last_element = element
    end
    counter
  end

  def compute_array_sums(array)
    window_indexes = [-2, -1, 0]
    windows_dict = {}
    windows_dict.default_proc = proc { |dict, key| dict[key] = [] }
    array.each do |element|
      window_indexes.each do |window_index|
        windows_dict[window_index] << element unless window_index.negative?
      end
      window_indexes = window_indexes.map { |value| value + 1 }
    end
    windows_dict.map do |_, value|
      value.sum
    end
  end

  def day1_second_part(array)
    array = compute_array_sums(array)
    day1_first_part(array)
  end
end

array = Program.read_from_file
puts Program.day1_first_part(array)
puts Program.day1_second_part(array)
