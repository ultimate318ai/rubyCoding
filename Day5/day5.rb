# Day 5 implementation
module Day5
  module_function

  def read_from_file
    input_coordinates = []
    File.open('input.txt').each do |line|
      x1y1, x2y2 = line.split(' -> ')
      x1, y1 = x1y1.split(',')
      x2, y2 = x2y2.split(',')
      puts 'x1:', x1
      puts 'y1:', y1
      puts 'x2:', x2
      puts 'y2:', y2
      # puts y2
    end
  end
end

Day5.read_from_file
