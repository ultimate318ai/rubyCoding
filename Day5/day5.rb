# Day 5 implementation
module Day5
  module_function

  def read_from_file
    input_coordinates = []
    File.open('input.txt').each_with_index do |line, index|
      puts line
    end
  end
end

Day5.read_from_file
